import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_cloud/config/resources/colors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.width,
    this.height,
    required this.controller,
    required this.node,
    required this.title,
    this.textInputType,
    this.obscureText = false,
    this.onTapFunction,
    this.icon,
    this.onSubmitted,
    this.validator,
    this.maxLength,
    this.backgroundColor,
    this.borderColor,
    this.iconColor,
    this.textColor,
    this.isDescription = false,
  });

  final double? width;
  final double? height;
  final TextEditingController controller;
  final FocusNode node;
  final String title;
  final TextInputType? textInputType;
  final bool? obscureText;
  final VoidCallback? onTapFunction;
  final IconData? icon;
  final Function(String)? onSubmitted;
  final String? Function(String?)? validator;
  final int? maxLength;
  final Color? backgroundColor, borderColor, iconColor, textColor;
  final bool isDescription;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? (isDescription ? 210.h : null),
      // height: height,
      width: width ?? 1.sw,
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType ?? TextInputType.text,
        focusNode: node,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              decorationThickness: 0,
              fontSize: 16.sp,
              color: textColor ?? AppColors.kPrimaryColor,
            ),
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: obscureText ?? false,
        cursorColor: textColor ?? AppColors.kPrimaryColor,
        maxLines: isDescription ? null : 1,
        minLines: isDescription ? 15 : 1,
        inputFormatters: [
          if (maxLength != null) LengthLimitingTextInputFormatter(maxLength),
        ],
        decoration: InputDecoration(
          hintText: title,
          alignLabelWithHint: true,
          fillColor: backgroundColor ?? AppColors.kWhiteColor,
          filled: true,
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: borderColor ?? AppColors.kPrimaryColor,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: borderColor ?? AppColors.kPrimaryColor,
              width: 1.0,
            ),
          ),
          // Border when there's an error
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
              color: AppColors.kErrorColor,
            ),
          ),

          // Border when focused and there's an error
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
              color: AppColors.kErrorColor,
              width: 1.0,
            ),
          ),
          isDense: true,
          suffixIcon: InkWell(
            overlayColor:
                const WidgetStatePropertyAll(AppColors.kTransparentColor),
            onTap: onTapFunction,
            child: Icon(
              icon,
              color: iconColor ?? AppColors.kPrimaryColor,
              size: 25,
            ),
          ),
          hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 16.sp,
                color: textColor ?? AppColors.kPrimaryColor,
              ),
          errorStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.kErrorColor,
                fontSize: 11.sp, // Customize the font size as needed
              ),
        ),
        onTapOutside: (event) {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        onFieldSubmitted: onSubmitted ??
            (value) {
              FocusScope.of(context).requestFocus(FocusNode());
            },
      ),
    );
  }
}
