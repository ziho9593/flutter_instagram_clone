import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_instagram_clone/src/binding/init_bindings.dart';
import 'package:flutter_instagram_clone/src/models/instagram_user.dart';
import 'package:flutter_instagram_clone/src/repository/user_repository.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  Rx<InstaUser> user = InstaUser().obs;

  Future<InstaUser?> loginUser(String uid) async {
    // DB 조회
    var userData = await UserRepository.loginUserByUid(uid);
    if (userData != null) {
      user(userData);
      InitBinding.additionalBinding();
    }
    return userData;
  }

  void signup(InstaUser signupUser, XFile? thumnail) async {
    if (thumnail == null) {
      _submitSignup(signupUser);
    } else {
      var task = uploadXFile(thumnail,
          '${signupUser.uid}/profile.${thumnail.path.split('.').last}');
      task.snapshotEvents.listen((event) async {
        if (event.bytesTransferred == event.totalBytes &&
            event.state == TaskState.success) {
          var downloadUrl = await event.ref.getDownloadURL();
          var updatedUserData = signupUser.copyWith(thumbnail: downloadUrl);
          _submitSignup(updatedUserData);
        }
      });
    }
  }

  UploadTask uploadXFile(XFile file, String fileName) {
    var f = File(file.path);

    // users/{uid}/profile.{확장자}
    var ref = FirebaseStorage.instance.ref().child('users').child(fileName);

    final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': file.path});

    return ref.putFile(f, metadata);
  }

  void _submitSignup(InstaUser signupUser) async {
    var result = await UserRepository.signup(signupUser);
    if (result) {
      loginUser(signupUser.uid!);
    }
  }
}
