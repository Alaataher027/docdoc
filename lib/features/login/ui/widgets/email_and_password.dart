import 'package:advanced_flutter_project/core/helper/app_regex.dart';
import 'package:advanced_flutter_project/core/widgets/app_text_form_field.dart';
import 'package:advanced_flutter_project/features/login/logic/cubit/login_cubit.dart';
import 'package:advanced_flutter_project/features/login/ui/widgets/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObsureText = true;

  bool hasUppercase = false;
  bool hasLowercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();

    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  // كل ما بكتب حاجة بيلسن عليها
  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "Email",
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return "Please enter a vaild email.";
              }
            },
            controller: context.read<LoginCubit>().emailController,
          ),
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
                isObsureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter the password!";
              }
            },
            controller: context.read<LoginCubit>().passwordController,
          ),
          SizedBox(height: 24.h),
          PasswordValidations(
            hasUpperCase: hasUppercase,
            hasLowerCase: hasLowercase,
            hasSpecialChars: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMimemumLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
