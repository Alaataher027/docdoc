import 'package:advanced_flutter_project/core/helper/extensions.dart';
import 'package:advanced_flutter_project/core/routes/routes.dart';
import 'package:advanced_flutter_project/core/theming/colors.dart';
import 'package:advanced_flutter_project/core/theming/styles.dart';
import 'package:advanced_flutter_project/features/login/logic/cubit/login_cubit.dart';
import 'package:advanced_flutter_project/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading ||
          current is Success ||
          current is Error, // listen something when do something
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: ColorsManager.mainBlue),
              ),
            );
          },
          success: (data) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          error: (error) {
            context.pop();
            setUpErrorState(context, error);
          },
        ); // whenOrNull >> in freezed
      },
      child: const SizedBox.shrink(),
    );
  }

  void setUpErrorState(BuildContext context, String errMessage) {
    context.pop;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: Colors.red, size: 32),
        content: Text(errMessage, style: TextStyles.font15DarkBlueMedium),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text('Got it', style: TextStyles.font14BlueSemiBold),
          ),
        ],
      ),
    );
  }
}
