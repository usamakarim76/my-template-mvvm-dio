import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_cloud/config/resources/colors.dart';
import 'package:memory_cloud/config/components/round_button.dart';
import 'package:memory_cloud/config/resources/text_constants.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class FilteringContainerWidget extends StatelessWidget {
  const FilteringContainerWidget({
    super.key,
    required this.media,
  });

  final List<String> media;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Filter",
          style: textTheme.titleMedium!.copyWith(
            fontSize: 18.sp,
            color: AppColors.kWhiteColor,
            fontWeight: FontWeight.w800,
          ),
        ),
        10.horizontalSpace,
        InkWell(
          onTap: () {
            showCupertinoModalBottomSheet(
              context: context,
              backgroundColor: AppColors.kWhiteColor,
              topRadius: Radius.circular(30.r),
              builder: (context) => Container(
                height: 0.65.sh,
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.verticalSpace,
                    Center(
                      child: Container(
                        width: .3.sw,
                        height: 5.h,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: AppColors.kPrimaryColor,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                      ),
                    ),
                    30.verticalSpace,
                    Text(
                      "Category",
                      style: textTheme.bodyLarge?.copyWith(
                        decoration: TextDecoration.none,
                        fontSize: 20.sp,
                      ),
                    ),
                    10.verticalSpace,
                    SizedBox(
                      height: 35.h,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 50.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border:
                                    Border.all(color: AppColors.kBlackColor),
                              ),
                              child: Center(
                                child: Text(
                                  "Category",
                                  style: textTheme.bodyLarge?.copyWith(
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              10.horizontalSpace,
                          itemCount: 5),
                    ),
                    30.verticalSpace,
                    Text(
                      "Media",
                      style: textTheme.bodyLarge?.copyWith(
                        decoration: TextDecoration.none,
                        fontSize: 20.sp,
                      ),
                    ),
                    10.verticalSpace,
                    SizedBox(
                      height: 35.h,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 50.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border:
                                    Border.all(color: AppColors.kBlackColor),
                              ),
                              child: Center(
                                child: Text(
                                  media[index],
                                  style: textTheme.bodyLarge?.copyWith(
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              10.horizontalSpace,
                          itemCount: media.length),
                    ),
                    30.verticalSpace,
                    Text(
                      "Date",
                      style: textTheme.bodyLarge?.copyWith(
                        decoration: TextDecoration.none,
                        fontSize: 20.sp,
                      ),
                    ),
                    10.verticalSpace,
                    SizedBox(
                      height: 35.h,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 50.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border:
                                    Border.all(color: AppColors.kBlackColor),
                              ),
                              child: Center(
                                child: Text(
                                  "Category",
                                  style: textTheme.bodyLarge?.copyWith(
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              10.horizontalSpace,
                          itemCount: 5),
                    ),
                    30.verticalSpace,
                    Text(
                      "Time",
                      style: textTheme.bodyLarge?.copyWith(
                        decoration: TextDecoration.none,
                        fontSize: 20.sp,
                      ),
                    ),
                    10.verticalSpace,
                    SizedBox(
                      height: 35.h,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 50.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border:
                                    Border.all(color: AppColors.kBlackColor),
                              ),
                              child: Center(
                                child: Text(
                                  "Category",
                                  style: textTheme.bodyLarge?.copyWith(
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              10.horizontalSpace,
                          itemCount: 5),
                    ),
                    30.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          child: ButtonWidget(
                            text: "Clear",
                            onTap: () {},
                            width: 170.w,
                            height: 50.h,
                          ),
                        ),
                        Card(
                          child: ButtonWidget(
                            text: "Apply Filters",
                            onTap: () {},
                            width: 170.w,
                            height: 50.h,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          child: const Icon(
            Icons.filter_list,
            color: AppColors.kSelectColor,
          ),
        ),
      ],
    );
  }
}
