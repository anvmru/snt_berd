import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:snt_berd/models/auser.dart';

enum AuthState {
  UNDEFINED,
  LOGIN,
  LOGOUT
}

abstract class BaseAuth {
  Future<String> signIn(String email, String password);
  Future<String> signUp(String email, String password);
  Future<fba.User> getCurrentUser();
  Future<void> signOut();
}

class Auth implements BaseAuth {
  final fba.FirebaseAuth _firebaseAuth = fba.FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    fba.UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user.uid;
  }

  Future<String> signUp(String email, String password) async {
    fba.UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user.uid;
  }

  Future<fba.User> getCurrentUser() async {
    fba.User user = await _firebaseAuth.currentUser;
    return user;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }


  Future<AUser> getUserDetails() async {
    // User user = _auth.currentUser;
    // if (user != null && user.uid != mUser?.uid) {
    //   try {
    //     DocumentSnapshot documentSnapshot = await _userCollection.doc(user.uid).get();
    //     if (documentSnapshot.exists) {
    //       mUser = Model.User.fromMap(documentSnapshot.data());
    //     } else {
    //       mUser = newMUser();
    //     }
    //     await addUserToDb(mUser);
    //     config = await loadConfig();
    //     if (mUser.uid == (config?.ownerId ?? "no defined")) {
    //       // User is owner! unsubscribe from broadcast
    //       FirebaseMessaging.instance.unsubscribeFromTopic(BROADCAST_TOPIC);
    //     }
    //   } catch (e) {
    //     print("** Error getUserDetails: $e");
    //     mUser = null;
    //   }
    // }
    // AppUser = mUser ?? Model.User();
    await Future.delayed(Duration(seconds: 10));
    return AUser();
  }

}