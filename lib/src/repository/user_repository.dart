import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_instagram_clone/src/models/instagram_user.dart';

class UserRepository {
  static Future<InstaUser?> loginUserByUid(String uid) async {
    var data = await FirebaseFirestore.instance
        .collection('users') // users라는 table을 참조
        .where('uid', isEqualTo: uid)
        .get();

    if (data.size == 0) {
      return null;
    } else {
      return InstaUser.fromJson(data.docs.first.data());
    }
  }

  static Future<bool> signup(InstaUser user) async {
    try {
      await FirebaseFirestore.instance.collection('users').add(user.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }
}
