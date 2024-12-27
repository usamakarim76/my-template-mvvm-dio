import 'package:flutter/material.dart';
import 'package:my_template/config/size_config.dart';

extension MediaQueryValues on BuildContext {
  double get screenHeight => MediaQuery.sizeOf(this).height;
  double get screenWidth => MediaQuery.sizeOf(this).width;
}

/// For the below extension check the SizeConfig class

extension SizeExtension on num {
  /// Converts a numeric value into a responsive height
  /// relative to the screen's height.
  double get ht => SizeConfig.height(toDouble());

  /// Converts a numeric value into a responsive width
  /// relative to the screen's width.
  double get wt => SizeConfig.width(toDouble());

  /// Converts the number into a responsive font size
  /// based on the screen's width.
  ///
  /// The calculation uses the reference width defined in
  /// `SizeConfig` to scale the font size proportionally.
  double get textScale => SizeConfig.scale(toDouble());
}

extension SizedBoxExtension on num {
  // For height-based SizedBox
  SizedBox get sh => SizedBox(height: SizeConfig.height(toDouble()));

  // For width-based SizedBox
  SizedBox get sw => SizedBox(width: SizeConfig.width(toDouble()));
}
