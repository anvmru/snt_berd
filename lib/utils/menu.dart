import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snt_berd/utils/const.dart';
import 'package:snt_berd/presentation/main_page.dart';

import '../presentation/chat_page.dart';
import '../presentation/home_page.dart';
import '../presentation/login_page.dart';
import '../presentation/signup_page.dart';
import '../providers/user_provider.dart';

Map<String, Widget Function(BuildContext)> menuRoutes = {
  HomePage.id: (context) => HomePage(),
  ChatPage.id: (context) => ChatPage(),
  LoginPage.id: (context) => LoginPage(),
  SignUpPage.id: (context) => SignUpPage(),
};

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.08),
              child: Image.asset("assets/blah.png", color: Theme.of(context).hoverColor),
          ),
          Divider(),
          ListTile(
            key: Key('Profile'),
            leading: Icon(Icons.person),
            title: Text(gLocale.menu_profile),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(LoginPage.id);
            },
            enabled: false,
          ),
          ListTile(
            key: Key('Settings'),
            leading: Icon(Icons.settings),
            title: Text(gLocale.menu_setting),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(SignUpPage.id);
            },
          ),
          Divider(),
          ListTile(
            key: Key('LogOut'),
            leading: Icon(Icons.exit_to_app),
            title: Text(gLocale.menu_logout),
            onTap: () {
              Provider.of<UserProvider>(context, listen: false).logout();
              Navigator.of(context).pushReplacementNamed(MainPage.id);
            },
            enabled: false,
          ),

        ],
      ),
    );
  }
}