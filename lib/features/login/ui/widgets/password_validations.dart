import 'package:advanced_flutter_project/core/theming/colors.dart';
import 'package:advanced_flutter_project/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasUpperCase;
  final bool hasLowerCase;
  final bool hasSpecialChars;
  final bool hasNumber;
  final bool hasMimemumLength;
  const PasswordValidations({
    super.key,
    required this.hasUpperCase,
    required this.hasLowerCase,
    required this.hasSpecialChars,
    required this.hasNumber,
    required this.hasMimemumLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow("At least one lowercase letter", hasLowerCase),
        SizedBox(height: 2.h),
        buildValidationRow("At least one upper case letter", hasUpperCase),
        SizedBox(height: 2.h),
        buildValidationRow("At least one 8 letters", hasMimemumLength),
        SizedBox(height: 2.h),
        buildValidationRow("At least one numder", hasNumber),
        SizedBox(height: 2.h),
        buildValidationRow("At least one special letter", hasSpecialChars),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(radius: 2.5, backgroundColor: ColorsManager.gray),
        SizedBox(width: 6.h),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationThickness: 2,
            decorationColor: Colors.green,
            color: hasValidated ? ColorsManager.gray : ColorsManager.darkBlue,
          ),
        ),
      ],
    );
  }
}
