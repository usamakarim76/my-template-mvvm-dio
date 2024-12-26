import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_cloud/config/resources/colors.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final bool isLoading;
  final VoidCallback onTap;
  final Color buttonColor, textColor, borderColor, loadingColor;
  final double? height, width;
  final IconData? icon;
  const ButtonWidget({
    super.key,
    required this.text,
    this.isLoading = false,
    required this.onTap,
    this.buttonColor = AppColors.kPrimaryColor,
    this.textColor = AppColors.kWhiteColor,
    this.borderColor = AppColors.kPrimaryColor,
    this.loadingColor = AppColors.kWhiteColor,
    this.height,
    this.width,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            height: height ?? 50.h,
            width: width ?? 1.sw,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: borderColor,
              ),
            ),
            child: Center(
              child: Platform.isAndroid
                  ? SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(
                        color: loadingColor,
                        strokeWidth: 1.5,
                      ),
                    )
                  : CupertinoActivityIndicator(
                      color: loadingColor,
                    ),
            ),
          )
        : GestureDetector(
            onTap: onTap,
            child: Container(
              height: height ?? 50.h,
              width: width ?? 1.sw,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: borderColor,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon == null
                      ? const SizedBox()
                      : Icon(
                          icon,
                          color: textColor,
                        ),
                  icon == null ? const SizedBox() : 10.horizontalSpace,
                  Text(
                    text,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: textColor,
                          fontSize: 18.sp,
                        ),
                  ),
                ],
              ),
            ),
          );
  }
}
