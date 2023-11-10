import 'package:flutter/material.dart';
import 'package:iwallet_study_case/theme/colors.dart';
import 'package:iwallet_study_case/theme/responsive_size.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });

  final String title;


  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                AppColors.shared.borderColor,
                AppColors.shared.purple
              ]),
        ),
      ),
      centerTitle: true,
      title: Text(title,
          style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.shared.white)),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(7.h);
}
