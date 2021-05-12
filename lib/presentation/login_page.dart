import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:snt_berd/models/auser.dart';
import 'package:snt_berd/utils/cached_image.dart';
import 'package:snt_berd/utils/utils.dart';

import '../providers/upload_provider.dart';
import '../providers/user_provider.dart';
import '../utils/const.dart';

typedef VoidCallback = void Function(BuildContext context);
// Model
enum LoginState { Undefine, Login, Logout }
enum LoginMode { bySms, byPassword }

class LoginModel {
  LoginState loginState;
  LoginMode loginMode;
  String displayName;
  String phone;
  String photoURL;
  String password;

  UploadProvider _uploadProvider;
  UserProvider _userProvider;

  LoginModel(BuildContext context) {
    loginState = LoginState.Undefine;
    loginMode = LoginMode.bySms;

    _uploadProvider = Provider.of<UploadProvider>(context);
    _userProvider = Provider.of<UserProvider>(context);

    if (_userProvider.auser == null) {
      displayName = Utils.getRandName();
    } else {
      displayName = _userProvider.auser.displayName;
      phone = _userProvider.auser.phoneNumber;
      photoURL = _userProvider.auser.photoURL;
    }
  }

  void loadPhoto(BuildContext context) async {
    _uploadProvider.setToLoading();
    try {} catch (e) {}
    _uploadProvider.setToIdle();
  }

  void login() {
    print("Model.login()");
  }

  void logout() {
    print("Model.logout()");
  }

  void update() {
    print("Model.update()");
  }
}

// Controller
class LoginController {
  final LoginModel _lm;

  LoginController(this._lm);

  String validateName(String value) {
    return ((value.length == 0) ? gLocale.valid_name : null);
  }

  String validatePhone(String value) {
    const String pattern = r'^(\s*)?(\+)?([- _():=+]?\d[- _():=+]?){10,14}(\s*)?$';
    RegExp regExp = new RegExp(pattern);
    return !regExp.hasMatch(value) ? gLocale.valid_phonev : (value.length == 0 ? gLocale.valid_phone : null);
  }

  void saveButton(BuildContext context) async {
    Navigator.pop(context);
  }

  void cancelButton(BuildContext context) async {
    Navigator.pop(context);
  }

  void loadPhoto(BuildContext context) async => await _lm.loadPhoto(context);
  void changeLoginMode(LoginMode mode) {}
}

// View
class LoginPage extends StatefulWidget {
  static const id = 'login_page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController tecName = TextEditingController();
  final TextEditingController tecPhone = TextEditingController();
  final TextEditingController tecPsw = TextEditingController();

  TextStyle titleStyle;
  LoginController _lc;
  LoginModel _lm;

  @override
  void didChangeDependencies() {
    _lm = LoginModel(context);
    _lc = LoginController(_lm);
    tecName.text = _lm.displayName;
    tecPhone.text = _lm.phone;
    titleStyle = TextStyle(
      fontSize: 18,
      color: Theme.of(context).indicatorColor,
    );
  }

  void changeLoginMode(LoginMode mode) {
    _lc?.changeLoginMode(mode);
    setState(() {
      _lm.loginMode = mode;
    });
  }

  void saveProfile(BuildContext context) {
    if (_formKey.currentState.validate()) {
      _lc.saveButton(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LoginAppBar(
        photoURL: _lm.photoURL,
        okFn: (context) => saveProfile(context),
        loadFn: (context) => _lc.loadPhoto(context),
      ),
      body: Form(
          key: _formKey,
          child: ListView(children: <Widget>[
            // Profile title
            Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  gLocale.title_pers_data,
                  textAlign: TextAlign.center,
                  style: titleStyle,
                )),
            // Field name
            ListTile(
              leading: const Icon(Icons.person),
              title: TextFormField(
                controller: tecName,
                decoration: new InputDecoration(hintText: gLocale.person_name),
                validator: (value) => _lc.validateName(value),
              ),
            ),
            // Field name
            ListTile(
              leading: const Icon(Icons.phone),
              title: TextFormField(
                controller: tecPhone,
                decoration: new InputDecoration(hintText: gLocale.person_phone),
                validator: (value) => _lc.validatePhone(value),
              ),
            ),
            // Authorization mode
            RadioListTile<LoginMode>(
              title: Text(gLocale.login_mode_sms),
              value: LoginMode.bySms,
              groupValue: _lm.loginMode,
              onChanged: (LoginMode mode) => changeLoginMode(mode),
              contentPadding: EdgeInsets.only(left: 10, top: 0, bottom: 0),
            ),
            RadioListTile<LoginMode>(
              title: Text(gLocale.login_mode_psw),
              value: LoginMode.byPassword,
              groupValue: _lm.loginMode,
              onChanged: (LoginMode mode) => changeLoginMode(mode),
              contentPadding: EdgeInsets.only(left: 10, top: 0, bottom: 0),
            ),
          ])),
    );
  }

  @override
  void dispose() {
    tecName.dispose();
    tecPhone.dispose();
    tecPsw.dispose();

    super.dispose();
  }
}

class LoginAppBar extends StatelessWidget with PreferredSizeWidget {
  final String photoURL;
  final VoidCallback okFn;
  final VoidCallback loadFn;

  @override
  final Size preferredSize;

  const LoginAppBar({Key key, this.photoURL, this.okFn, this.loadFn})
      : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle btnTextStyle = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: Colors.white, //Theme.of(context).indicatorColor,
    );

    return AppBar(
      title: GestureDetector(
        onTap: () => loadFn,
        child: photo(context),
      ),
      centerTitle: true,
      // actions: [
      // TextButton(
      //   onPressed: () => okFn,
      //   child: Text(gLocale.btn_save, style: btnTextStyle),
      // )],
    );
  }

  Container photo(BuildContext context) {
    const double sz = 0.15;
    return Container(
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.width * sz,
            maxWidth: MediaQuery.of(context).size.width * sz
        ),
        child: Stack(alignment: Alignment.bottomRight, children: <Widget>[
          (photoURL == null)
              ? Image.asset('assets/blah.png', color: Theme.of(context).buttonColor, fit: BoxFit.fitHeight)
              : CachedImage(photoURL, isRound: true, radius: MediaQuery.of(context).size.width * sz),
          Icon(
            Icons.camera,
            color: Theme.of(context).backgroundColor,
          ),
        ]));
  }
}
