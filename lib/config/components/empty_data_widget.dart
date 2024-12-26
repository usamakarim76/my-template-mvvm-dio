import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lottie/lottie.dart';
import 'package:memory_cloud/config/components/round_button.dart';
import 'package:memory_cloud/config/resources/colors.dart';

class EmptyStateWidget extends StatelessWidget {
  final String? message;
  final String? buttonText;
  final VoidCallback onButtonPressed;
  final IconData? icon;
  // final String? animationPath;

  const EmptyStateWidget({
    Key? key,
    this.message,
    this.buttonText,
    required this.onButtonPressed,
    this.icon,
    // this.animationPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // // Lottie animation
            // Lottie.asset(
            //   animationPath ?? '',
            //   width: 200,
            //   height: 200,
            //   repeat: true,
            //   fit: BoxFit.contain,
            // ),
            Icon(
              icon ?? Icons.no_photography_outlined,
              size: 100,
              color: AppColors.kWhiteColor,
            ),
            20.verticalSpace,
            // Message text
            Text(
              message ?? "Data is empty",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.kWhiteColor,
                  ),
              textAlign: TextAlign.center,
            ),
            30.verticalSpace,
            // Button
            ButtonWidget(
              text: buttonText ?? "Add",
              onTap: onButtonPressed,
              buttonColor: AppColors.kWhiteColor,
              textColor: AppColors.kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
