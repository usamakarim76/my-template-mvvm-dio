import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_cloud/config/resources/colors.dart';
import 'package:memory_cloud/config/resources/text_constants.dart';

class CameraGalleryWidget extends StatelessWidget {
  const CameraGalleryWidget({
    super.key,
    required this.firstOnTap,
    required this.secondOnTap,
    required this.firstIcon,
    required this.secondIcon,
    required this.firstTitle,
    required this.secondTitle,
  });
  final VoidCallback firstOnTap, secondOnTap;
  final IconData firstIcon, secondIcon;
  final String firstTitle, secondTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.27.sh,
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.verticalSpace,
          Center(
            child: Container(
              width: .3.sw,
              height: 5.h,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: AppColors.kPrimaryColor,
                borderRadius: BorderRadius.circular(5.r),
              ),
            ),
          ),
          30.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                child: InkWell(
                  onTap: firstOnTap,
                  overlayColor:
                      const WidgetStatePropertyAll(AppColors.kTransparentColor),
                  child: Container(
                    height: 130.h,
                    width: 0.35.sw,
                    decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child:
                        // Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // children: [
                        // Icon(
                        //   firstIcon,
                        //   color: AppColors.kPrimaryColor,
                        //   size: 45,
                        // ),
                        Center(
                      child: Text(
                        firstTitle,
                        style: textTheme.bodySmall?.copyWith(
                          decoration: TextDecoration.none,
                          fontSize: 24.sp,
                          color: AppColors.kWhiteColor,
                        ),
                      ),
                    ),
                    // ],
                    // ),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  onTap: secondOnTap,
                  overlayColor:
                      const WidgetStatePropertyAll(AppColors.kTransparentColor),
                  child: Container(
                    height: 130.h,
                    width: 0.35.sw,
                    decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child:
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Icon(
                        //       secondIcon,
                        //       color: AppColors.kPrimaryColor,
                        //       size: 45,
                        //     ),
                        Center(
                      child: Text(
                        secondTitle,
                        style: textTheme.bodySmall?.copyWith(
                          decoration: TextDecoration.none,
                          fontSize: 24.sp,
                          color: AppColors.kWhiteColor,
                        ),
                      ),
                    ),
                    //   ],
                    // ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
