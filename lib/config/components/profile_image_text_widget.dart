import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_cloud/config/resources/colors.dart';
import 'package:memory_cloud/config/resources/text_constants.dart';

class ProfileImageTextContainerWidget extends StatelessWidget {
  const ProfileImageTextContainerWidget({
    super.key,
    required this.imagePath,
    required this.title,
  });
  final String imagePath, title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 168.h,
      width: 0.4.sw,
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage(imagePath),
      //   ),
      // ),
      // alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          Image.asset(
            imagePath,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 53.h,
              width: 1.sw,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(22.r),
                  bottomRight: Radius.circular(22.r),
                ),
              ),
              child: Center(
                child: Text(
                  title,
                  style: textTheme.titleMedium!.copyWith(
                    color: AppColors.kWhiteColor,
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
