import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_cloud/config/resources/colors.dart';
import 'package:memory_cloud/config/resources/text_constants.dart';

class DrawerButtonContainer extends StatelessWidget {
  const DrawerButtonContainer({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.kPrimaryColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            icon,
            20.horizontalSpace,
            Text(
              title,
              style: textTheme.titleMedium?.copyWith(
                color: AppColors.kWhiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
