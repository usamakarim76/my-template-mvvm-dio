import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_cloud/config/resources/app_strings.dart';
import 'package:memory_cloud/config/resources/colors.dart';
import 'package:memory_cloud/config/components/round_button.dart';
import 'package:memory_cloud/config/components/text_field_widget.dart';
import 'package:memory_cloud/config/resources/images_url.dart';
import 'package:memory_cloud/config/routes/route_name.dart';
import 'package:memory_cloud/utils/extensions/validations_exception.dart';
import 'package:memory_cloud/utils/utils.dart';
import 'package:memory_cloud/view_model/signup_view_model/signup_view_bloc_bloc.dart';

import '../../config/components/text_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  FocusNode emailNode = FocusNode();
  FocusNode userNameNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  ValueNotifier<bool> obscureText = ValueNotifier<bool>(true);
  bool isLoading = false;
  late SignupViewBloc signupViewBloc;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    signupViewBloc = context.read<SignupViewBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: SingleChildScrollView(
        child: BlocListener<SignupViewBloc, SignupViewBlocState>(
          listener: (context, state) {
            if (state is SignupViewErrorState) {
              Utils.showFailureMessage(
                message: state.message,
                context: context,
              );
            } else if (state is SignupViewSuccessState) {
              Utils.showSuccessMessage(
                message: AppStrings.accountCreated,
                context: context,
              );
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteNames.loginScreen,
                (route) => false,
              );
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80.h,
                  ),
                  Center(
                    child: Image.asset(
                      AppImagesUrl.appLogo,
                      width: 205.w,
                      height: 100.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Center(
                    child: Text(
                      AppStrings.signUp,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    AppStrings.username,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFieldWidget(
                    node: userNameNode,
                    title: AppStrings.username,
                    controller: userNameController,
                    textInputType: TextInputType.emailAddress,
                    onSubmitted: (value) {
                      Utils.focusNodeChange(context, userNameNode, emailNode);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.requiredText;
                      }
                      return null;
                    },
                    icon: Icons.person_2_outlined,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    AppStrings.email,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFieldWidget(
                    node: emailNode,
                    title: AppStrings.email,
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                    onSubmitted: (value) {
                      Utils.focusNodeChange(context, emailNode, passwordNode);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.requiredText;
                      }
                      if (!value.emailValidator()) {
                        return AppStrings.emailNotValid;
                      }
                      return null;
                    },
                    icon: Icons.email_outlined,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    AppStrings.password,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.requiredText;
                          } else if (value.length < 8) {
                            return AppStrings.passwordEightDigitLong;
                          }
                          return null;
                        },
                        icon: obscureText.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      );
                    },
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  BlocBuilder<SignupViewBloc, SignupViewBlocState>(
                    // buildWhen: (previous, current) => isLoading,
                    builder: (context, state) {
                      if (state is SignupViewLoadingState) {
                        isLoading = true;
                      } else if (state is SignupViewSuccessState) {
                        isLoading = false;
                      } else if (state is SignupViewErrorState) {
                        isLoading = false;
                      }
                      return ButtonWidget(
                        text: AppStrings.register,
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          if (_formKey.currentState?.validate() ?? false) {
                            signupViewBloc.add(RegisterUserEvent(
                              userNameController.text,
                              emailController.text,
                              passwordController.text,
                            ));
                          }
                        },
                        isLoading: isLoading,
                      );
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: TextButtonWidget(
                      title: AppStrings.alreadyHaveAnAccountLogin,
                      onPress: () {
                        Navigator.pop(context);
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
