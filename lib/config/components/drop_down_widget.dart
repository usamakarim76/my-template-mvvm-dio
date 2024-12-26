import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_cloud/config/resources/colors.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget(
      {super.key,
      required this.value,
      required this.list,
      required this.onChanged});
  final String value;
  final List<String> list;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: AppColors.kWhiteColor,
        ),
      ),
      // padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: DropdownButton<String>(
        value: value,
        underline: const SizedBox(),
        isExpanded: true,
        dropdownColor: AppColors.kPrimaryColor,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        borderRadius: BorderRadius.circular(10.r),
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.kWhiteColor,
              fontSize: 16.sp,
            ),
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: AppColors.kWhiteColor,
        ),
        hint: const Text(
          'Select People',
          // style: Theme.of(context).textTheme.bodySmall?.copyWith(
          //       fontSize: 16.sp,
          //       color: AppColors.kWhiteColor,
          //     ),
        ),
        onChanged: onChanged,
        items: list.map<DropdownMenuItem<String>>((dynamic value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              // style: Theme.of(context).textTheme.bodySmall?.copyWith(
              //       fontSize: 16.sp,
              //     ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
