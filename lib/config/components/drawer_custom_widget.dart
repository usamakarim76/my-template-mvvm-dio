import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_cloud/config/resources/colors.dart';
import 'package:memory_cloud/config/resources/images_url.dart';
import 'package:memory_cloud/config/resources/text_constants.dart';
import 'package:memory_cloud/config/routes/route_name.dart';
import 'package:memory_cloud/services/storage/secure_storage_service.dart';

import 'drawer_button_container.dart';

class DrawerCustomWidget extends StatelessWidget {
  const DrawerCustomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.kWhiteColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 1.sw,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 80.h,
                    width: 80.w,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.kPrimaryColor.withValues(alpha: 0.3),
                      ),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Image.asset(
                      "assets/images/thomas.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  10.horizontalSpace,
                  SizedBox(
                    width: 180.w,
                    child: Text(
                      "Thomas",
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 18.sp,
                      ),
                    ),
                  )
                ],
              ),
            ),
            20.verticalSpace,
            const Divider(
              color: AppColors.kPrimaryColor,
            ),
            60.verticalSpace,
            DrawerButtonContainer(
              title: "Home",
              icon: Image.asset(
                AppImagesUrl.homeIcon,
                width: 20.w,
                height: 20.h,
              ),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RouteNames.navBarScreen,
                  (Route<dynamic> route) => false,
                );
              },
            ),
            DrawerButtonContainer(
              title: "Cloned Voices",
              icon: Image.asset(
                AppImagesUrl.clonedVoiceIcon,
                width: 20.w,
                height: 20.h,
              ),
              onTap: () {
                Navigator.pushNamed(context, RouteNames.clonedVoicesView);
              },
            ),
            DrawerButtonContainer(
              title: "Settings",
              icon: const Icon(
                Icons.settings,
                color: AppColors.kWhiteColor,
              ),
              onTap: () {
                Navigator.pushNamed(context, RouteNames.settingView);
              },
            ),
            DrawerButtonContainer(
              title: "Logout",
              icon: const Icon(
                Icons.logout,
                color: AppColors.kWhiteColor,
              ),
              onTap: () async {
                await LocalStorage().deleteAllData();
                Navigator.pushNamedAndRemoveUntil(
                  // ignore: use_build_context_synchronously
                  context,
                  RouteNames.loginScreen,
                  (Route<dynamic> route) => false,
                );
              },
            ),
            DrawerButtonContainer(
              title: "Delete Account",
              icon: const Icon(
                Icons.delete_forever_outlined,
                color: AppColors.kWhiteColor,
              ),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RouteNames.loginScreen,
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
