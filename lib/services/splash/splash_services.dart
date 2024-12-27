import 'package:flutter/material.dart';
import 'package:my_template/config/resources/app_strings.dart';
import 'package:my_template/config/routes/route_name.dart';
import 'package:my_template/services/storage/secure_storage_service.dart';

/// A class containing services related to the splash screen.
class SplashServices {
  /// Checks authentication status and navigates accordingly.
  BuildContext context;
  SplashServices(this.context);
  LocalStorage storage = LocalStorage();
  void checkAuthentication() async {
    try {
      String? loginToken = await storage.readValue(AppStrings.accessToken);
      if (loginToken == null || loginToken == "") {
        _navigate(RouteNames.loginScreen);
      } else {
        _navigate(RouteNames.navBarScreen);
      }
    } catch (_) {
      _navigate(RouteNames.loginScreen);
    }
  }

  void _navigate(String path) {
    Navigator.pushNamedAndRemoveUntil(context, path, (route) => false);
  }
}
