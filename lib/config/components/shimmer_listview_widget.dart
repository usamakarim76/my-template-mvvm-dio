import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_cloud/config/resources/colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListviewWidget extends StatelessWidget {
  const ShimmerListviewWidget({
    super.key,
    this.height,
    this.itemCount,
    this.widget,
    this.baseColor,
    this.hightLightColor,
  });

  final double? height;
  final int? itemCount;
  final Widget? widget;
  final Color? baseColor, hightLightColor;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemCount ?? 8,
      separatorBuilder: (context, index) => widget ?? 10.verticalSpace,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor:
              (baseColor ?? AppColors.kWhiteColor).withValues(alpha: 0.1),
          highlightColor:
              (hightLightColor ?? AppColors.kWhiteColor).withValues(alpha: 0.3),
          child: Container(
            height: height ?? 80.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        );
      },
    );
  }
}
