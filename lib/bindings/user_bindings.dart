import 'package:get/get.dart';
import 'package:iwallet_study_case/controllers/users_controller.dart';


class UserBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController());

  }
}
