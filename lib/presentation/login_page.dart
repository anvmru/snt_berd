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

// Model
/*
Данные и бизнес-логика
*/
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
}

// Controller
/*
1) приём запроса от пользователя;
2) анализ запроса;
3) выбор следующего действия системы, соответственно результатам анализа
(например, передача запроса другим элементам системы).
*/
class LoginController {
  final LoginModel _lm;

  LoginController(this._lm);

  String validateName(String value) {
    return ((value.length == 0) ? gLocale.valid_name : null);
  }

  void saveButton(BuildContext context) async {
    Navigator.pop(context);
  }

  void cancelButton(BuildContext context) async {
    Navigator.pop(context);
  }

  void loadPhoto(BuildContext context) async => await _lm.loadPhoto(context);
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
  LoginController lc;
  LoginModel lm;

  @override
  void didChangeDependencies() {
    lm = LoginModel(context);
    lc = LoginController(lm);
    tecName.text = lm.displayName;
    tecPhone.text = lm.phone;
    titleStyle = TextStyle(
      fontSize: 18,
      color: Theme.of(context).indicatorColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: ListView(children: <Widget>[
              prifileAppBar(context, lm.photoURL),

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
                title: new TextFormField(
                  controller: tecName,
                  decoration: new InputDecoration(
                    hintText: gLocale.person_name,
                  ),
                  validator: (value) {
                    return lc.validateName(value);
                  },
                ),
              ),
            ])));
  }

  Widget prifileAppBar(BuildContext context, String photoURL) {
    TextStyle btnTextStyle = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).indicatorColor,
    );
    var sizeApp = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextButton(
          onPressed: () => lc.cancelButton(context),
          child: Text(gLocale.btn_cancel, style: btnTextStyle),
        ),
        SizedBox(width: sizeApp.width * 0.02),
        Expanded(
            child: Center(
                child: GestureDetector(
                    onTap: () => lm.loadPhoto(context),
                    child: Container(
                        constraints: BoxConstraints(maxHeight: sizeApp.width * 0.3, maxWidth: sizeApp.width * 0.3),
                        child: Stack(alignment: Alignment.bottomRight, children: <Widget>[
                          (photoURL == null)
                              ? Image.asset('assets/blah.png',
                                  color: Theme.of(context).buttonColor, fit: BoxFit.fitHeight)
                              : CachedImage(photoURL, isRound: true, radius: sizeApp.width * 0.3),
                          // Container(child:
                          Icon(
                            Icons.camera,
                            color: Theme.of(context).backgroundColor,
                          ),
                        ]))))),
        SizedBox(width: sizeApp.width * 0.02),
        TextButton(
          onPressed: () {
            if (_formKey.currentState.validate()) {
              lc.saveButton(context);
            }
          },
          child: Text(gLocale.btn_save, style: btnTextStyle),
        ),
      ]),
    );
  }

  @override
  void dispose() {
    tecName.dispose();
    tecPhone.dispose();
    tecPsw.dispose();
  }
}
