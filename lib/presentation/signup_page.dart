import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/const.dart';

class SignUpPage extends StatelessWidget {
  static const id = 'signup_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/icon_web.png"),
        title: Text(gLocale.title_signup),
        centerTitle: true,
      ),
      body: Container(),
    );
  }

}

