import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:snt_berd/presentation/login_page.dart';
import '../presentation/home_page.dart';
import '../providers/user_provider.dart';

import '../utils/const.dart';
import 'chat_page.dart';

class MainPage extends StatefulWidget {
  static const id = 'main_page';
  final UserProvider _userProvider;
  MainPage(this._userProvider);

  @override
  _MainPageState createState() => _MainPageState();

}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  UserProvider get _userProvider => widget._userProvider;
  final PageController _pageController = PageController();
  int _page;

  @override
  void initState() {
    super.initState();
    _page = 0;
    WidgetsBinding.instance.addObserver(this);
    // // работает по окончании кадра, следит за статусом пользователя
    // SchedulerBinding.instance.addPostFrameCallback((_) async {
    // });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        _userProvider.setUserState(UserState.Online);
        break;
      case AppLifecycleState.paused:
        _userProvider.setUserState(UserState.Waiting);
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      default:
      _userProvider.setUserState(UserState.Offline);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Theme.of(context).backgroundColor,
        body: PageView(
          children: <Widget>[
            HomePage(),
            ChatPage(),
          ],
          controller: _pageController,
          onPageChanged: (page) => setState(() => _page = page),
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: Container(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0),
          child: BottomNavigationBar(
            selectedItemColor: Theme.of(context).indicatorColor,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: gLocale.bar_home),
              BottomNavigationBarItem(icon: Icon(Icons.chat), label: gLocale.bar_chat),
            ],
            onTap: (page) => _pageController.jumpToPage(page),
            currentIndex: _page,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
          ),
        )),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.person_add),
          onPressed: () => Navigator.of(context).pushNamed(LoginPage.id),
        ),
    );
  }

  @override
  void dispose() {
    _pageController?.dispose();
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }
}
