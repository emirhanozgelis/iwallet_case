import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iwallet_study_case/models/user/user_model.dart';
import 'package:iwallet_study_case/models/user_image/user_image_model.dart';
import 'package:iwallet_study_case/services/user_services.dart';
import 'package:iwallet_study_case/widgets/custom_snackbar.dart';

class UserController extends GetxController {
  List<UserModel> allUserList = <UserModel>[];

  RxList<UserModel> tempUserList = <UserModel>[].obs;

  TextEditingController searchTE=TextEditingController();
  RxBool loading = false.obs;
  UserServices userServices = UserServices();

  @override
  void onInit() {
    getUserList();
    super.onInit();
  }

  getUserList() async {
    try {
      loading.value = true;
      allUserList = await userServices.getUserList();
      await getUserImage();
      tempUserList.value=allUserList;

    } catch (e) {
      showAppSnackBar("Başarısız", e.toString());
    } finally {
      loading.value = false;
    }
  }

  getUserImage() async {
    for (var user in allUserList) {
      ImageModel image = await userServices.getImageDetails(user.id);
      user.image = image;
    }
    
  }

void searchUser(String? val) {
  if (val == "" || val == null) {
    tempUserList.value = allUserList;
  } else {
    List<UserModel> matchingUsers = [];

    for (var item in allUserList) {
      if (item.name.toLowerCase().contains(val.toLowerCase())) {
        matchingUsers.add(item);
      }
    }

    tempUserList.value = matchingUsers;
  }
}
}
