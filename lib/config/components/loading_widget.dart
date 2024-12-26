import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_cloud/config/resources/colors.dart';
import 'package:memory_cloud/config/resources/images_url.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.color = AppColors.kWhiteColor});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoActivityIndicator(
            color: color,
          )
        : CircularProgressIndicator(
            color: color,
            strokeWidth: 1.5,
          );
  }
}

class LoadingDialog {
  static void show(
    BuildContext context, {
    String title = 'Loading...',
    String message = 'Loading...',
    required VoidCallback onRetry,
    required VoidCallback onCancel,
  }) {
    Platform.isIOS
        ?
        // Show Cupertino (iOS-style) dialog
        showCupertinoDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                content: Column(
                  children: [
                    const CupertinoActivityIndicator(
                      color: AppColors.kPrimaryColor,
                      radius: 20.0,
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      message,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                // actions: [
                //   CupertinoDialogAction(
                //     onPressed: onRetry,
                //     child: Text("Retry"),
                //   ),
                //   CupertinoDialogAction(
                //     onPressed: onCancel,
                //     child: Text("Cancel"),
                //     isDestructiveAction: true,
                //   ),
                // ],
              );
            },
          )
        :

        // Show Material (Android-style) dialog
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  side: BorderSide(color: Colors.grey.shade300, width: 1.5),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 50.w,
                      height: 50.h,
                      child: Lottie.asset(AppImagesUrl.lottieLoading),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      message,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                // actions: [
                //   Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       ElevatedButton(
                //         onPressed: onRetry,
                //         style: ElevatedButton.styleFrom(
                //           backgroundColor: Colors.blueAccent,
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(
                //                 10), // Rounded button corners
                //           ),
                //         ),
                //         child: Text("Retry",
                //             style: TextStyle(color: Colors.white)),
                //       ),
                //       OutlinedButton(
                //         onPressed: onCancel,
                //         style: OutlinedButton.styleFrom(
                //           side: BorderSide(color: Colors.grey.shade400),
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //         ),
                //         child: Text("Cancel",
                //             style: TextStyle(color: Colors.black54)),
                //       ),
                //     ],
                //   ),
                // ],
              );
            },
          );
  }

  static void hide(BuildContext context) {
    Navigator.pop(context);
  }
}
