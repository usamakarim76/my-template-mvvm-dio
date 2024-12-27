import 'package:my_template/config/resources/colors.dart';
import 'package:my_template/config/routes/route_name.dart';

import 'views_dependency.dart';

class Routes {
  static Route? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      // case RouteNames.splashScreen:
      //   return MaterialPageRoute(
      //     builder: (BuildContext context) => const SplashScreen(),
      //   );
      // case RouteNames.loginScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) =>
      //           LoginViewBloc(authRepository: AuthRepository()),
      //       child: const LoginView(),
      //     ),
      //   );
      // case RouteNames.signUpScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) =>
      //           SignupViewBloc(authRepository: AuthRepository()),
      //       child: const SignUpView(),
      //     ),
      //   );

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text(
                "No Route Found for ${settings.name}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.kWhiteColor,
                ),
              ),
            ),
          );
        });
    }
  }
}
