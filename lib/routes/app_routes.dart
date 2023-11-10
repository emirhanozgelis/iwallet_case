import 'package:get/get.dart';
import 'package:iwallet_study_case/bindings/user_bindings.dart';
import 'package:iwallet_study_case/routes/page_names.dart';
import 'package:iwallet_study_case/views/users_page.dart';


appRoutes() => [
      GetPage(
        name: PageNames.shared.users,
        page: () => const  UsersPage(),
        transition: Transition.leftToRightWithFade,
        binding: UserBindings(),
      ),
    ];
