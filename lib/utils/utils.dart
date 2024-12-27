import 'package:flutter/material.dart';
import 'package:my_template/config/extensions/extensions.dart';
import 'package:my_template/config/resources/colors.dart';

class Utils {
  static int messageShowTime = 2;

  static void focusNodeChange(
      BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static void showSuccessMessage(
      {required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: AppColors.kWhiteColor),
            SizedBox(width: 10.wt),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 14.textScale,
                  color: AppColors.kWhiteColor,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.kSuccessColor,
        duration: Duration(seconds: messageShowTime),
        behavior: SnackBarBehavior.floating,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        // animation: CurvedAnimation(
        //   parent: AnimationController(
        //     duration: const Duration(milliseconds: 100),
        //     vsync: Scaffold.of(context),
        //   ),
        //   curve: Curves.bounceInOut,
        // ),
      ),
    );
  }

  static void showFailureMessage(
      {required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.cancel, color: AppColors.kWhiteColor),
            SizedBox(width: 10.wt),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 14.textScale,
                  color: AppColors.kWhiteColor,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.kErrorColor,
        duration: Duration(seconds: messageShowTime),
        behavior: SnackBarBehavior.floating,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        // animation: CurvedAnimation(
        //   parent: AnimationController(
        //     duration: const Duration(milliseconds: 100),
        //     vsync: Scaffold.of(context),
        //   ),
        //   curve: Curves.bounceInOut,
        // ),
      ),
    );
  }
}
