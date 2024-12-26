import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_cloud/config/resources/colors.dart';

class SimpleAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const SimpleAppBarWidget({
    super.key,
    required this.title,
    this.backGroundColor,
    this.textColor,
    this.appBarForgroundColor,
    this.leadingWidget,
    this.actionWidget,
  });
  final String title;
  final Color? backGroundColor, textColor, appBarForgroundColor;
  final Widget? leadingWidget, actionWidget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backGroundColor,
      title: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: textColor ?? AppColors.kPrimaryColor,
              fontSize: 20.sp,
            ),
      ),
      leading: leadingWidget == null
          ? null
          : Transform.scale(
              scale: 0.5,
              child: leadingWidget,
            ),
      centerTitle: true,
      scrolledUnderElevation: 0,
      foregroundColor: appBarForgroundColor,
      actions: [
        actionWidget == null
            ? const SizedBox()
            : Transform.scale(
                scale: 0.85,
                child: actionWidget,
              ),
        10.horizontalSpace,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
