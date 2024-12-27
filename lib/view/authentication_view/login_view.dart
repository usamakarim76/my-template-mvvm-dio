import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_template/config/components/round_button.dart';
import 'package:my_template/config/components/text_field_widget.dart';
import 'package:my_template/config/extensions/extensions.dart';
import 'package:my_template/config/extensions/validations_exception.dart';
import 'package:my_template/config/resources/app_strings.dart';
import 'package:my_template/config/resources/colors.dart';
import 'package:my_template/config/resources/images_url.dart';
import 'package:my_template/config/routes/route_name.dart';
import 'package:my_template/utils/utils.dart';
import 'package:my_template/view_model/login_view_model/login_view_bloc.dart';
import '../../config/components/text_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  ValueNotifier<bool> obscureText = ValueNotifier<bool>(true);
  late LoginViewBloc loginViewBloc;
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void initState() {
    loginViewBloc = context.read<LoginViewBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: BlocListener<LoginViewBloc, LoginViewState>(
        listener: (context, state) {
          if (state is LoginViewErrorState) {
            Utils.showFailureMessage(
              message: state.message,
              context: context,
            );
          } else if (state is LoginViewSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
                context, RouteNames.navBarScreen, (route) => false);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.wt, vertical: 30.ht),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  80.sh,
                  Center(
                    child: Image.asset(
                      AppImagesUrl.appLogo,
                      width: 205.wt,
                      height: 100.ht,
                      fit: BoxFit.contain,
                    ),
                  ),
                  50.sh,
                  Center(
                    child: Text(
                      AppStrings.login,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  30.sh,
                  Text(
                    AppStrings.email,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  10.sh,
                  TextFieldWidget(
                    node: emailNode,
                    title: AppStrings.email,
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                    onSubmitted: (value) {
                      Utils.focusNodeChange(context, emailNode, passwordNode);
                    },
                    icon: Icons.email_outlined,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.requiredText;
                      }
                      if (!value.emailValidator()) {
                        return AppStrings.emailNotValid;
                      }
                      return null;
                    },
                  ),
                  20.sh,
                  Text(
                    AppStrings.password,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  10.sh,
                  ValueListenableBuilder(
                    valueListenable: obscureText,
                    builder: (context, value, child) {
                      return TextFieldWidget(
                        node: passwordNode,
                        controller: passwordController,
                        title: AppStrings.password,
                        textInputType: TextInputType.text,
                        obscureText: obscureText.value,
                        onTapFunction: () {
                          obscureText.value = !obscureText.value;
                        },
                        icon: obscureText.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.requiredText;
                          }
                          return null;
                        },
                      );
                    },
                  ),
                  50.sh,
                  BlocBuilder<LoginViewBloc, LoginViewState>(
                    builder: (context, state) {
                      if (state is LoginViewLoadingState) {
                        isLoading = true;
                      } else if (state is LoginViewSuccessState) {
                        isLoading = false;
                      } else if (state is LoginViewErrorState) {
                        isLoading = false;
                      }
                      return ButtonWidget(
                        text: AppStrings.login,
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          if (_formKey.currentState?.validate() ?? false) {
                            loginViewBloc.add(LoginPostApiEvent(
                              context,
                              emailController.text,
                              passwordController.text,
                            ));
                          }
                        },
                        height: 50.ht,
                        width: context.screenWidth,
                        isLoading: isLoading,
                        loadingColor: AppColors.kWhiteColor,
                      );
                    },
                  ),
                  10.sh,
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButtonWidget(
                      title: AppStrings.forgotPassword,
                      onPress: () {
                        Navigator.pushNamed(
                            context, RouteNames.forgotStepFirst);
                      },
                      textTheme: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 16.textScale),
                    ),
                  ),
                  10.sh,
                  Center(
                    child: TextButtonWidget(
                      title: AppStrings.dontHaveAnAccountRegister,
                      onPress: () {
                        Navigator.pushNamed(context, RouteNames.signUpScreen);
                      },
                      textTheme: Theme.of(context).textTheme.bodySmall!,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
