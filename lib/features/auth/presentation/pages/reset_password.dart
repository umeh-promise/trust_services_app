import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_services_app/core/utils/route_manager.dart';
import 'package:trust_services_app/core/utils/toast.dart';
import 'package:trust_services_app/core/widgets/app_sub_heading.dart';
import 'package:trust_services_app/core/widgets/button.dart';
import 'package:trust_services_app/core/widgets/scaffold_title.dart';
import 'package:trust_services_app/core/widgets/text_input.dart';
import 'package:trust_services_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:trust_services_app/features/auth/presentation/pages/login.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;
  final String otp;

  static route(String email, String otp) => MaterialPageRoute(
    builder: (ctx) => ResetPasswordScreen(email: email, otp: otp),
  );

  const ResetPasswordScreen({
    super.key,
    required this.email,
    required this.otp,
  });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          Toast.error(context, state.message);
        }

        if (state is AuthPasswordResetSuccess) {
          Toast.success(context, 'Password reset successful!');
          Routes.pushAndRemoveUntil(LoginScreen.route(), false);
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;

        return Scaffold(
          appBar: AppBar(title: ScaffoldTitle('Enter new passsword')),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                spacing: 24,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppSubHeading('Enter new password and confirm'),
                  TextInput(
                    label: 'New Password',
                    hintText: '••••••••',
                    controller: _passwordController,
                    obscureText: true,
                  ),
                  TextInput(
                    label: 'Confirm Password',
                    hintText: '••••••••',
                    controller: _confirmPasswordController,
                    obscureText: true,
                    validator: (value) {
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  Button(
                    'Confirm Password',
                    isProcessing: isLoading,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthCubit>().resetPasswordWithOtp(
                          widget.email,
                          widget.otp,
                          _passwordController.text.trim(),
                        );
                      }
                    },
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
