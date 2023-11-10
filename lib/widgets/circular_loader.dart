import 'package:flutter/material.dart';
import 'package:iwallet_study_case/theme/colors.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({Key? key, this.color}) : super(key: key);
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: color ?? AppColors.shared.backgroundColor,
        valueColor: AlwaysStoppedAnimation<Color>(
          AppColors.shared.purple,
        ),
      ),
    );
  }
}
