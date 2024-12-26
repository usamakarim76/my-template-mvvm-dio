import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_cloud/config/resources/images_url.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            Navigator.pop(context);
          },
      child: SizedBox(
        width: 35.w,
        height: 35.h,
        child: Image.asset(
          AppImagesUrl.backButton,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
