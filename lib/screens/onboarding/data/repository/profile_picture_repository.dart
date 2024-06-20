import 'dart:convert';

import 'package:dreamfarm/screens/onboarding/data/services/profile_picture_service.dart';
import 'package:dreamfarm/utilities/firebase_auth/auth.dart';
import 'package:dreamfarm/utilities/modals/custom_exception.dart';
import 'package:dreamfarm/utilities/session_manager/session_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePictureRepository {
  ProfilePictureService profilePictureService = ProfilePictureService();
  final picker = ImagePicker();
  Auth auth = Auth();
  SessionManager sessionManager = SessionManager();

  Future getImageLink(ImageSource imageSource) async {
    try {
      XFile? pickedFile = await picker.pickImage(source: imageSource);

      final response =
          await profilePictureService.uploadToCloudinary(pickedFile!);

      final responseData = await response.stream.bytesToString();
      final result = json.decode(responseData);
      print(result["secure_url"]);
      return result["secure_url"];
    } on CustomException {
      rethrow;
    } catch (e) {
      throw CustomException(message: "Something went wrong", code: 0);
    }
  }

  Future setProfileImageLink(String url) async {
    try {
      auth.updateProfilePicture(url);
      sessionManager.setProfileUrl(url);
    } on FirebaseAuthException catch (e) {
      return CustomException(message: e.message!, code: 0);
    }
  }
}
