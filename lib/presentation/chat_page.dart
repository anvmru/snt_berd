import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/const.dart';

class ChatPage extends StatelessWidget {
  static const id = 'chat_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/icon_web.png"),
        title: Text(gLocale.bar_chat),
        centerTitle: true,
      ),
      body: Container(),
    );
  }

}

