import 'package:flutter/material.dart';
import 'package:iwallet_study_case/theme/colors.dart';
import 'package:iwallet_study_case/theme/responsive_size.dart';

// ignore: must_be_immutable
class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({
    Key? key,
    required this.textController,
    this.onChanged,
  }) : super(key: key);

  TextEditingController textController;
  Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return  SearchBar(
      
        onChanged: onChanged,
        controller: textController,
        leading: Icon(
          Icons.search,
          color: AppColors.shared.purple.withOpacity(0.5),
        ),
        backgroundColor:
            MaterialStateProperty.all<Color?>(AppColors.shared.backgroundColor),
        shadowColor: MaterialStateProperty.all<Color?>(Colors.transparent),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
          const EdgeInsets.symmetric(horizontal: 15.0),
        ),
        side: MaterialStateProperty.all<BorderSide?>(
          BorderSide(color: AppColors.shared.purple.withOpacity(0.5)),
        ),
        hintText: "Kullanıcı ara",
        hintStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(
            color: AppColors.shared.purple.withOpacity(0.5),
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
          ),
        ),

      );
    
  }
}
