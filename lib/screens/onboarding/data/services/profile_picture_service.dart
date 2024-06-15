import 'package:dreamfarm/utilities/modals/custom_exception.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePictureService {
  Future uploadToCloudinary(XFile imageFile) async {
    try {
      final cloudinaryUrl = dotenv.env["CLOUDINARY_URL"];
      final request = http.MultipartRequest('POST', Uri.parse(cloudinaryUrl!))
        ..fields['upload_preset'] = 'bisineimages'
        ..files.add(await http.MultipartFile.fromPath('file', imageFile.path));
      final response = await request.send();
      return response;
    } catch (e) {
      print("Hi");
      print(e);
      throw CustomException(message: "Something went wrong !", code: 0);
    }
  }
}
