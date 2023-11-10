import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iwallet_study_case/routes/app_routes.dart';
import 'package:iwallet_study_case/theme/colors.dart';

import 'routes/page_names.dart';

void main() {
      WidgetsFlutterBinding.ensureInitialized();

  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
          initialRoute: PageNames.shared.users,
          getPages: appRoutes(),
          theme: ThemeData(
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: AppColors.shared.black,
                ),
           
          ),
          debugShowCheckedModeBanner: false,
          title: 'Find User',
        );
  }
}

