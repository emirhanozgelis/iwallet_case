import 'package:flutter/material.dart';
import 'package:get/get.dart';

showAppSnackBar(
  String title,
  String message,
) {
  return Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    borderRadius: 20,
    margin: const EdgeInsets.all(15),
    colorText: Colors.black,
    duration: const Duration(seconds: 4),
    isDismissible: true,
    dismissDirection: DismissDirection.down,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
