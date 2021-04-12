//import 'package:cloud_firestore/cloud_firestore.dart';

class AUser {
  String uid;
  String fcmToken;
  String displayName;
  String about;
  String phoneNumber;
  String photoURL;
  String email;
  int state;
  int actor;
  DateTime timestamp;
//  Timestamp timestamp;

  AUser(
      {this.uid,
      this.fcmToken,
      this.displayName,
      this.about,
      this.phoneNumber,
      this.photoURL,
      this.email,
      this.state,
        this.actor,
      this.timestamp});

  bool equais(AUser user) {
    return (user is AUser
      && this?.uid         == user?.uid
      && this?.fcmToken    == user?.fcmToken
      && this?.displayName == user?.displayName
      && this?.about       == user?.about
      && this?.phoneNumber == user?.phoneNumber
      && this?.photoURL    == user?.photoURL
      && this?.email       == user?.email
        && this?.actor       == user?.actor
    );
  }

  factory AUser.copy(AUser user) {
    return AUser(
    uid: user.uid,
    fcmToken: user.fcmToken,
    displayName: user.displayName,
    about: user.about,
    phoneNumber: user.phoneNumber,
    photoURL: user.photoURL,
    email: user.email,
    state: user.state,
    actor: user.actor,
    timestamp: user.timestamp
    );
  }

  factory AUser.fromMap(Map<String, dynamic> map) {
    return AUser(
        uid: map['uid'] as String,
        fcmToken: map['fcm_token'] as String,
        displayName: map['display_name'] as String,
        about: map['about'] as String,
        phoneNumber: map['phone_number'] as String,
        photoURL: map['photo_url'] as String,
        email: map['email'] as String,
        state: map['state'] as int,
        actor: map['actor'] as int,
        timestamp: map['timestamp'] // as Timestamp
    );
  }

  Map toMap() {
    var map = Map<String, dynamic>();
    map['uid'] = this.uid;
    map['display_name'] = this.displayName;

    if (this.fcmToken != null) map['fcm_token'] = this.fcmToken;
    if (this.about != null) map['about'] = this.about;
    if (this.phoneNumber != null) map['phone_number'] = this.phoneNumber;
    if (this.photoURL != null) map['photo_url'] = this.photoURL;
    if (this.email != null) map['email'] = this.email;

    if (this.state != null) map['state'] = this.state;
    if (this.actor != null) map['actor'] = this.state;
    map['timestamp'] = (this.timestamp != null) ? this.timestamp : null; // FieldValue.serverTimestamp();

    return map;
  }
}
