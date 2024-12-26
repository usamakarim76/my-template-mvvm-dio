import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_cloud/config/resources/colors.dart';
import 'package:memory_cloud/config/resources/images_url.dart';

class CheckButtonWidget extends StatelessWidget {
  const CheckButtonWidget({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 35.w,
        height: 35.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.kWhiteColor,
        ),
        child: Center(
          child: Image.asset(
            AppImagesUrl.checkIcon,
            height: 28.h,
            width: 28.w,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
