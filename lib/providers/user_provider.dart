import 'package:flutter/material.dart';
import '../models/auser.dart';

enum UserState{
  Offline,
  Online,
  Waiting,
}

class UserProvider with ChangeNotifier{

  AUser _auser;
  AUser get auser => _auser;
  set auser(value) => _auser = value;

  bool get isAnonymous => true;
  bool get isOwner => true;

  Future<void> refreshUser() async{
    notifyListeners();
  }

  void setUserState(UserState userState) {
    // TODO
  }

  void logout() {

  }
  void login() {

  }
  void saveEmail(String email) {
    return;
  }

}