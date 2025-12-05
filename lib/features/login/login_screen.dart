import 'package:advanced_flutter_project/core/theming/colors.dart';
import 'package:advanced_flutter_project/core/theming/styles.dart';
import 'package:advanced_flutter_project/core/widgets/app_text_button.dart';
import 'package:advanced_flutter_project/core/widgets/app_text_form_field.dart';
import 'package:advanced_flutter_project/features/login/ui/widgets/already_have_account_text.dart';
import 'package:advanced_flutter_project/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormFieldState>();
  bool isObsureText = true;
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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AppTextFormField(hintText: "Email"),
                      SizedBox(height: 18.h),
                      AppTextFormField(
                        hintText: "Password",
                        isObsureText: isObsureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObsureText = !isObsureText;
                            });
                          },
                          child: Icon(
                            isObsureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
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
                        onPressed: () {},
                      ),
                      SizedBox(height: 16.h),
                      const TermsAndConditionsText(),
                      SizedBox(height: 60.h),
                      const AlreadyHaveAccountText(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
