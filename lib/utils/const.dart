import 'package:flutter/material.dart';

import '../generated/l10n.dart';

S gLocale;

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return //CircularProgressIndicator();
        Scaffold(
      backgroundColor: Color(0xff393185),
      body: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
        alignment: Alignment.center,
        child: Stack(children: [
          // Column(children: [
          //   Align(child: Image.asset("assets/icon_web.png")),
          //   Align(child: Text(gLocale.app_name,
          //       style: TextStyle(fontSize: 32)
          //   )
          //   )]
          // ),
          Align(child: Image.asset("assets/icon_web.png")),
          Align(
              child: CircularProgressIndicator(
            strokeWidth: 8.0,
            valueColor: AlwaysStoppedAnimation(Colors.cyan[400]),
          )),
        ]),
      ),
    );
  }
}
