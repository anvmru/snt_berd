import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/const.dart';
import '../utils/menu.dart';

class HomePage extends StatelessWidget {
  static const id = 'home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gLocale.bar_home),
        centerTitle: true,
      ),
      drawer: MainMenu(),
      body: Container(),
    );
  }

}

