
class Message {
  String id;
  String senderId;
  String receiverId;
  String type;
  String message;
  DateTime timestamp;
//  Timestamp timestamp;
  String attachUrl;

  Message({this.senderId, this.receiverId, this.message, this.type, this.timestamp, this.attachUrl});

  Map toMap() {
    var map = Map<String, dynamic>();
    map['sender_id'] = this.senderId;
    map['receiver_id'] = this.receiverId;
    map['type'] = this.type;
    map['message'] = this.message;
    map['timestamp'] = this.timestamp != null ? this.timestamp : DateTime.fromMicrosecondsSinceEpoch(0, isUtc: true); //FieldValue.serverTimestamp();
    if(this.attachUrl != null) map['attach_url'] = this.attachUrl;
    return map;
  }

  // named constructor
  Message.fromMap(Map<String, dynamic> map) {
    this.senderId = map['sender_id'] as String;
    this.receiverId = map['receiver_id'] as String;
    this.type = map['type'] as String;
    this.message = map['message'] as String;
    this.attachUrl = map['attach_url'] as String;
    this.timestamp = map['timestamp'] as DateTime; //Timestamp;
  }
}
