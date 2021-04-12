import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';
import 'utils/menu.dart';
import 'presentation/main_page.dart';
import 'providers/upload_provider.dart';
import 'providers/user_provider.dart';
import 'utils/const.dart';
import 'utils/theme.dart';

final _navKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // await Firebase.initializeApp();
  // PushNotificationsManager().init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: kLightTheme,
      dark: kDarkTheme,
      initial: AdaptiveThemeMode.light,
      builder: (light, dark) => MultiProvider(
        providers: [
          ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
          ChangeNotifierProvider<UploadProvider>(create: (_) => UploadProvider()),
        ],
        child: MaterialApp(
          navigatorKey: _navKey,
          onGenerateTitle: (context) => S.of(context).app_name,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          theme: light,
          darkTheme: dark,
          routes: menuRoutes,
          home: Consumer<UserProvider>(builder: (context, value, child) {
            gLocale = S.of(_navKey.currentState.overlay.context);
            return MainPage(value);
          }),
        ),
      ),
    );
  }
}
