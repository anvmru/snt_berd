import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../states/appuser.dart';
import '../main.dart';

class Utils {
  static String getUsername(String email) {
    return "live:${email.split('@')[0]}";
  }

  static String getInitials(String name) {
    String lastNameInitial = "";
    List<String> nameSplit = name.split(" ");
    String firstNameInitial = nameSplit[0][0];
    if(nameSplit.length > 1) {
      lastNameInitial = nameSplit[1][0];
    }
    return firstNameInitial + lastNameInitial;
  }

  // this is new

  static int stateToNum(UserState userState) {
    switch (userState) {
      case UserState.Offline:
        return 0;

      case UserState.Online:
        return 1;

      default:
        return 2;
    }
  }

  static UserState numToState(int number) {
    switch (number) {
      case 0:
        return UserState.Offline;

      case 1:
        return UserState.Online;

      default:
        return UserState.Waiting;
    }
  }


  // static Future<void> alert1(BuildContext context, String text) async {
  //   return await showDialog<bool>(
  //       context: context,
  //       builder: (BuildContext context) => AlertDialog(
  //         title: Text(gLocale.translate("dlg_attenion")),
  //         content: Text(text), //gLocale.translate("dlg_message1")),
  //         actions: [
  //           TextButton(
  //               child: Text(gLocale.translate("btn_ok")), onPressed: (() => Navigator.of(context).pop())),
  //         ],
  //       ));
  // }

  static showError(String msg) {
    print(msg);

    Fluttertoast.showToast(
    msg: msg,
    textColor: Colors.white,
    backgroundColor: Colors.red,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 3,
    fontSize: 16.0,
    );
  }

  static String getRandName() {
    const List<String> names = ["Mon", "Tue", "Wed", "Trs", "Frd", "Std", "Sun"];
    String name = names[DateTime.now().weekday - 1] + Random().nextInt(10000).toString();
    print("Random name: $name");
    return name;
  }
}