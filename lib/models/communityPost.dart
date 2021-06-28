import 'package:mother_and_baby/models/asiriUser.dart';

class CommunityPost {
  final String text;
  final List<dynamic> imageList;
  final String userId;
  int likeCount;
  final int createdAt;
  AsiriUser userData;
  List<dynamic> likedUserIdList = [];

  CommunityPost(this.text, this.imageList, this.userId, this.createdAt);

  Map<String, dynamic> toJson() => {
        'text': text,
        'imageList': imageList.toList(),
        'likedUserIdList': likedUserIdList.toList(),
        'likeCount': likeCount,
        'userId': userId,
        'createdAt': createdAt,
        'userData': userData.toJson()
      };

  CommunityPost.fromJson(Map<String, dynamic> json)
      : text = json["text"],
        likeCount = json["likeCount"],
        imageList = json["imageList"],
        createdAt = json["createdAt"],
        likedUserIdList = json["likedUserIdList"],
        userData = AsiriUser.fromJson(json["userData"]),
        userId = json["userId"];
}
