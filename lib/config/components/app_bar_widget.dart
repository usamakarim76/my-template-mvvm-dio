import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_cloud/config/resources/colors.dart';
import 'package:memory_cloud/config/resources/images_url.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onPress;
  const AppBarWidget({
    super.key,
    required this.title,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: AppColors.kWhiteColor,
              fontSize: 20.sp,
            ),
      ),
      iconTheme: const IconThemeData(color: AppColors.kSelectColor, size: 30),
      actions: [
        IconButton(
          onPressed: onPress,
          icon: const Icon(
            Icons.add,
            size: 30,
            color: AppColors.kSelectColor,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        SizedBox(
          height: 35.h,
          width: 35.w,
          child: Image.asset(AppImagesUrl.homePersonLogo),
        ),
        SizedBox(
          width: 15.w,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
