import 'package:advanced_flutter_project/core/theming/styles.dart';
import 'package:advanced_flutter_project/core/widgets/app_text_button.dart';
import 'package:advanced_flutter_project/features/login/data/models/login_request_body.dart';
import 'package:advanced_flutter_project/features/login/logic/cubit/login_cubit.dart';
import 'package:advanced_flutter_project/features/login/ui/widgets/already_have_account_text.dart';
import 'package:advanced_flutter_project/features/login/ui/widgets/email_and_password.dart';
import 'package:advanced_flutter_project/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:advanced_flutter_project/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome Back', style: TextStyles.font24BlueBold),
                SizedBox(height: 8.h),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GrayRegular,
                ),
                SizedBox(height: 36.h),
                Column(
                  children: [
                    const EmailAndPassword(),
                    SizedBox(height: 24.h),
                    Align(
                      alignment: AlignmentDirectional
                          .centerEnd, // AlignmentDirectional >> for arabic
                      child: Text(
                        "Forgot Password?",
                        textAlign: TextAlign.end,
                        style: TextStyles.font13BlueRegular,
                      ),
                    ),
                    SizedBox(height: 40.h),

                    AppTextButton(
                      buttonText: "Login",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    SizedBox(height: 16.h),
                    const TermsAndConditionsText(),
                    SizedBox(height: 60.h),
                    const AlreadyHaveAccountText(),
                    const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginState(
        LoginRequestBody(
          email: context.read<LoginCubit>().emailController.text,
          password: context.read<LoginCubit>().passwordController.text,
        ),
      );
    }
  }
}
