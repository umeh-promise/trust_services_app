import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_services_app/core/theme/colors.dart';
import 'package:trust_services_app/core/utils/route_manager.dart';
import 'package:trust_services_app/core/utils/toast.dart';
import 'package:trust_services_app/core/widgets/app_sub_heading.dart';
import 'package:trust_services_app/core/widgets/button.dart';
import 'package:trust_services_app/core/widgets/scaffold_title.dart';
import 'package:trust_services_app/core/widgets/text_input.dart';
import 'package:trust_services_app/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:trust_services_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:trust_services_app/features/auth/presentation/pages/login.dart';
import 'package:trust_services_app/features/auth/presentation/pages/otp.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (ctx) => ForgotPasswordScreen());

  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().forgotPassword(
        ForgotPasswordParams(email: _emailController.text.trim()),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          Toast.error(context, state.message);
        }

        if (state is AuthLogoutSuccess) {
          Routes.push(OTPScreen.route(_emailController.text));
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;
        return Scaffold(
          appBar: AppBar(title: ScaffoldTitle('Reset password')),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                spacing: 24,
                children: [
                  AppSubHeading(
                    'Enter your sign up email, to reset your passsword',
                  ),
                  TextInput(
                    label: 'Email address',
                    hintText: '@gmail.com',
                    controller: _emailController,
                    type: TextInputTypes.email,
                  ),
                  Button(
                    'Continue',
                    isProcessing: isLoading,
                    onPressed: _onSubmit,
                  ),
                  InkWell(
                    onTap: () => Routes.push(LoginScreen.route()),
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: 'Login',
                            style: Theme.of(context).textTheme.labelSmall!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppPallete.primaryColor,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
