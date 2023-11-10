import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iwallet_study_case/constants/image_urls.dart';
import 'package:iwallet_study_case/controllers/users_controller.dart';
import 'package:iwallet_study_case/models/user/user_model.dart';
import 'package:iwallet_study_case/models/user_image/user_image_model.dart';
import 'package:iwallet_study_case/theme/colors.dart';
import 'package:iwallet_study_case/theme/dimensions.dart';
import 'package:iwallet_study_case/theme/responsive_size.dart';
import 'package:iwallet_study_case/widgets/circular_loader.dart';
import 'package:iwallet_study_case/widgets/custom_alertdialog.dart';
import 'package:iwallet_study_case/widgets/custom_appbar.dart';
import 'package:iwallet_study_case/widgets/search_textfield.dart';

class UsersPage extends GetView<UserController> {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Kullanıcı Listesi",
      ),
      body: pageBody(),
    );
  }

  Widget pageBody() {
    return RefreshIndicator(
      onRefresh: () => controller.getUserList(),
      color: AppColors.shared.purple,
      child: Padding(
        padding: AppDimensions.shared.pagePadding,
        child: Column(
          children: [
            CustomSearchBar(
              textController: controller.searchTE,
              onChanged: controller.searchUser,
            ),
            SizedBox(
              height: 2.h,
            ),
            Obx(() => controller.loading.value
                ? const CircularLoader()
                : Expanded(
                    child: ListView.separated(
                    itemCount: controller.tempUserList.length,
                    separatorBuilder: (context, index) => SizedBox(
                      height: 2.h,
                    ),
                    itemBuilder: (context, index) =>
                        userCard(controller.tempUserList[index]),
                  )))
          ],
        ),
      ),
    );
  }

  Widget userCard(UserModel userModel) {
    return InkWell(
      onTap: () => showUserAlertDialog(user: userModel),
      child: Container(
        width: Get.width,
        height: 9.h,
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.shared.purple),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            userImage(userModel.image),
            SizedBox(
              width: 3.w,
            ),
            Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userModel.name,
                      style: TextStyle(
                          fontSize: 11.sp, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      userModel.username,
                      style: TextStyle(
                          fontSize: 11.sp, fontWeight: FontWeight.w500),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget userImage(ImageModel? imageModel) {
    return Expanded(
        flex: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: imageModel == null
              ? Image.asset(
                  AppImages.shared.noUserImage,
                  fit: BoxFit.fill,
                )
              : Image.network(
                  imageModel.downloadUrl,
                  fit: BoxFit.fill,
                  width: 65,
                  height: 65,
                ),
        ));
  }
}
