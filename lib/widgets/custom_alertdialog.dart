import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iwallet_study_case/constants/image_urls.dart';
import 'package:iwallet_study_case/models/user/user_model.dart';
import 'package:iwallet_study_case/theme/responsive_size.dart';

showUserAlertDialog({
  required UserModel user,
}) {
  return Get.dialog(
    UserPopup(user: user),
    barrierDismissible: false,
  );
}

class UserPopup extends StatelessWidget {
  final UserModel user;

  const UserPopup({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.close))),
              userImage(),
              SizedBox(height: 1.h),
              Text(
                user.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "@${user.username}",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 2.h),
              valueKeyRow("Email:", user.email),
              valueKeyRow("Telefon:", user.phone),
              valueKeyRow(
                  "Adres:", "${user.address.street} ${user.address.suite} "),
              valueKeyRow("Şehir:", user.address.city),
              valueKeyRow(
                  "Konum:", "${user.address.geo.lat} - ${user.address.geo.lng}"),
            ],
          ),
        ),
      ),
    );
  }

  Widget userImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: user.image == null
          ? Image.asset(
              AppImages.shared.noUserImage,
              fit: BoxFit.fill,
            )
          : Image.network(
              user.image!.downloadUrl,
              fit: BoxFit.fill,
              width: 150,
              height: 150,
            ),
    );
  }

  Padding valueKeyRow(String key, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              key,
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          Expanded(
            flex: 4,
            child: Text(
              value,
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
