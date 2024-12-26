import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_cloud/config/components/round_button.dart';
import 'package:memory_cloud/config/resources/colors.dart';

class ErrorWidgetWithRetry extends StatelessWidget {
  final String? errorMessage;
  final VoidCallback onRetry;
  final Color? color;

  const ErrorWidgetWithRetry({
    Key? key,
    required this.errorMessage,
    required this.onRetry,
    this.color,
  }) : super(key: key);

  String _getErrorMessage(String? error) {
    if (error?.contains("No Internet Connection") == true) {
      return "No internet connection. Please check your network and try again.";
    } else if (error?.contains("Receiving timeout occurred") == true) {
      return "Request timed out. Please try again.";
    } else {
      return "An unexpected error occurred. Please try again.";
    }
  }

  @override
  Widget build(BuildContext context) {
    final displayMessage = _getErrorMessage(errorMessage);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.wifi_off_rounded,
            size: 80,
            color: Colors.red,
          ),
          30.verticalSpace,
          Text(
            displayMessage,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: color ?? AppColors.kWhiteColor,
                ),
          ),
          50.verticalSpace,
          ButtonWidget(
            text: "Retry",
            onTap: onRetry,
            width: 0.5.sw,
            buttonColor: AppColors.kSelectColor,
            textColor: AppColors.kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
