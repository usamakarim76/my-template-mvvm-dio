import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:my_template/config/extensions/extensions.dart';
import 'package:my_template/config/resources/colors.dart';

extension FlushBarErrorMessage on BuildContext {
  void flushBarErrorMessage({required String message}) {
    showFlushbar(
        context: this,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 15.wt, vertical: 10.ht),
          padding: EdgeInsets.all(15),
          message: message,
          duration: const Duration(seconds: 3),
          borderRadius: BorderRadius.circular(10),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: AppColors.kErrorColor,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: const Icon(
            Icons.error,
            // size: 28,
            color: AppColors.kWhiteColor,
          ),
        )..show(this));
  }
}

extension FlushBarSuccessMessage on BuildContext {
  void flushBarSuccessMessage({required String message}) {
    showFlushbar(
        context: this,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 15.wt, vertical: 10.ht),
          padding: EdgeInsets.all(15),
          message: message,
          duration: const Duration(seconds: 3),
          borderRadius: BorderRadius.circular(10),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: AppColors.kSuccessColor,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: const Icon(
            Icons.check_circle,
            // size: 28,
            color: AppColors.kWhiteColor,
          ),
        )..show(this));
  }
}
