import 'package:get/get.dart';

extension SizerExt on num {
 
  double get h => this * Get.height / 100;

  double get w => this * Get.width / 100;

  double get sp => this * (Get.width / 3) / 100;
}
