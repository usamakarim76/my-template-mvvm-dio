import 'package:flutter/material.dart';
import 'package:memory_cloud/config/resources/colors.dart';

class TextButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final TextStyle textTheme;
  const TextButtonWidget({
    super.key,
    required this.title,
    required this.onPress,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPress,
        style: const ButtonStyle(
          overlayColor: WidgetStatePropertyAll(
            AppColors.kWhiteColor,
          ),
        ),
        child: Text(
          title,
          style: textTheme,
        ));
  }
}
