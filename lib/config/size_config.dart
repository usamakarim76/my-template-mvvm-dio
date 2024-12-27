import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  // Your design's reference height
  static double referenceHeight = 930;
  // Your design's reference width
  static double referenceWidth = 430;

  // Initialize screen dimensions
  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
  }

  // Get height as a percentage of total height
  static double height(double inputHeight) {
    return (inputHeight / referenceHeight) * screenHeight;
  }

  // Get width as a percentage of total width
  static double width(double inputWidth) {
    return (inputWidth / referenceWidth) * screenWidth;
  }

  // Get font size
  static double scale(double fontSize) {
    return (fontSize / referenceWidth) * screenWidth;
  }

  static const double horizontalPadding = 30;
  static const double verticalPadding = 30;
}
