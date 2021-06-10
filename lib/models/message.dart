class Message {
  final String text;
  final String userId;
  final String userName;
  final int createdAt;

  Message(this.text, this.userId, this.userName, this.createdAt);

  Map<String, dynamic> toJson() => {
        "text": text,
        "userId": userId,
        "userName": userName,
        "createdAt": createdAt,
      };

  Message.fromJson(Map<String, dynamic> json)
      : text = json["text"],
        userName = json["userName"],
        createdAt = json["createdAt"],
        userId = json["userId"];
}
