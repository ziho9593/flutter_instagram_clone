class InstaUser {
  String? uid;
  String? nickname;
  String? thumbnail;
  String? description;

  InstaUser({
    this.uid,
    this.nickname,
    this.thumbnail,
    this.description,
  });

  factory InstaUser.fromJson(Map<String, dynamic> json) {
    return InstaUser(
      uid: json['uid'] == null ? '' : json['uid'] as String,
      nickname: json['nickname'] == null ? '' : json['nickname'] as String,
      thumbnail: json['thumbnail'] == null ? '' : json['thumbnail'] as String,
      description:
          json['description'] == null ? '' : json['description'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'nickname': nickname,
      'thumbnail': thumbnail,
      'description': description,
    };
  }
}
