import 'dart:convert';
import 'package:http/http.dart';
import 'package:iwallet_study_case/constants/base_urls.dart';
import 'package:iwallet_study_case/models/user/user_model.dart';
import 'package:iwallet_study_case/models/user_image/user_image_model.dart';
import 'package:iwallet_study_case/services/base_services.dart';
import 'package:iwallet_study_case/widgets/custom_snackbar.dart';

class UserServices {

  Future<List<UserModel>> getUserList() async {
    try {
      Response? response =
          await BaseServiceRequests.getRequest(BaseUrls.userListUrl);

      if (response != null || response?.statusCode == 200) {
        List<dynamic> userListJson = json.decode(response!.body);

        List<UserModel> userList =
            userListJson.map((json) => UserModel.fromJson(json)).toList();

        return userList;
      } else {
          showAppSnackBar("Başarısız","API iletişiminde bir sorun meydana geldi.");
          return [];
      }
    } catch (e) {
      throw Exception(
          "Kullanıcı listesini çekerken bir hata oluştu: ${e.toString()}");
    }
  }
  
  Future<ImageModel> getImageDetails(int userId) async {
    try {
      Response? response =
          await BaseServiceRequests.getRequest("${BaseUrls.userImageUrl+userId.toString()}/info");

      if (response != null && response.statusCode == 200) {
        Map<String, dynamic> imageData = json.decode(response.body);

        ImageModel imageModel = ImageModel.fromJson(imageData);

        return imageModel;
      } else {
          showAppSnackBar("Başarısız","Resim detaylarını çekerken bir hata oluştu");
          return ImageModel(id: "", author: "", width: 0, height: 0, url: "", downloadUrl: "");

      }
    } catch (e) {
      throw Exception("Resim detaylarını çekerken bir hata oluştu: ${e.toString()}");
    }
  }

}
