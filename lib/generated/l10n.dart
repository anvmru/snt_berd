// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `DSONT Berd`
  String get app_name {
    return Intl.message(
      'DSONT Berd',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get bar_home {
    return Intl.message(
      'Home',
      name: 'bar_home',
      desc: '',
      args: [],
    );
  }

  /// `Board`
  String get bar_dashboard {
    return Intl.message(
      'Board',
      name: 'bar_dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get bar_chat {
    return Intl.message(
      'Chat',
      name: 'bar_chat',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get bar_settings {
    return Intl.message(
      'Settings',
      name: 'bar_settings',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get title_login {
    return Intl.message(
      'Log In',
      name: 'title_login',
      desc: '',
      args: [],
    );
  }

  /// `SignUp`
  String get title_signup {
    return Intl.message(
      'SignUp',
      name: 'title_signup',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get menu_logout {
    return Intl.message(
      'Log Out',
      name: 'menu_logout',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get menu_profile {
    return Intl.message(
      'Profile',
      name: 'menu_profile',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get menu_setting {
    return Intl.message(
      'Settings',
      name: 'menu_setting',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get btn_save {
    return Intl.message(
      'Ok',
      name: 'btn_save',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get btn_cancel {
    return Intl.message(
      'Cancel',
      name: 'btn_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Name (required)`
  String get person_name {
    return Intl.message(
      'Name (required)',
      name: 'person_name',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get person_phone {
    return Intl.message(
      'Phone',
      name: 'person_phone',
      desc: '',
      args: [],
    );
  }

  /// `About me`
  String get person_notes {
    return Intl.message(
      'About me',
      name: 'person_notes',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get person_email {
    return Intl.message(
      'Email',
      name: 'person_email',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get btn_yes {
    return Intl.message(
      'Yes',
      name: 'btn_yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get btn_no {
    return Intl.message(
      'No',
      name: 'btn_no',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get btn_ok {
    return Intl.message(
      'OK',
      name: 'btn_ok',
      desc: '',
      args: [],
    );
  }

  /// `Enter your personal data and photo`
  String get title_pers_data {
    return Intl.message(
      'Enter your personal data and photo',
      name: 'title_pers_data',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get valid_name {
    return Intl.message(
      'Please enter your name',
      name: 'valid_name',
      desc: '',
      args: [],
    );
  }

  /// `Sign In with Google`
  String get sign_google {
    return Intl.message(
      'Sign In with Google',
      name: 'sign_google',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}