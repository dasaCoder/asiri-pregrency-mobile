class AsiriUser {
  final String userId;
  final String name;
  final String email;
  final String telephone;
  final String address;
  final String imageUrl;
  String calculatedMethod;
  int pregnantStartDate;
  int dueDate;
  int kickCount;

  AsiriUser(this.userId, this.name, this.email, this.telephone, this.address, this.imageUrl,);

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'userId': userId,
        'telephone': telephone,
        'address': address,
        'calculatedMethod': calculatedMethod,
        'pregnantStartDate': pregnantStartDate,
        'dueDate': dueDate,
        'kickCount': kickCount,
        'imageUrl': imageUrl,
      };

  AsiriUser.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        email = json["email"],
        userId = json["userId"],
        telephone = json["telephone"],
        address = json["address"],
        calculatedMethod = json["calculatedMethod"],
        pregnantStartDate = json["pregnantStartDate"],
        dueDate = json["dueDate"],
        imageUrl = json["imageUrl"],
        kickCount = json["kickCount"];
}
