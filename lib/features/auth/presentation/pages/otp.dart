import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_services_app/core/utils/app_route.dart';
import 'package:trust_services_app/core/utils/toast.dart';
import 'package:trust_services_app/core/widgets/app_sub_heading.dart';
import 'package:trust_services_app/core/widgets/button.dart';
import 'package:trust_services_app/core/widgets/scaffold_title.dart';
import 'package:trust_services_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:trust_services_app/features/auth/presentation/pages/reset_password.dart';
import 'package:trust_services_app/features/auth/presentation/widgets/otp_input.dart';

class OTPScreen extends StatefulWidget {
  final String email;

  static route(String email) =>
      MaterialPageRoute(builder: (ctx) => OTPScreen(email: email));

  const OTPScreen({super.key, required this.email});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String _otp = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          Toast.error(context, state.message);
        }

        if (state is AuthPasswordResetOtpSent) {
          Toast.success(context, 'New code sent!');
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: ScaffoldTitle('Enter OTP')),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppSubHeading(
                  'A one-time-password has been sent to the email you provided (${widget.email}). Enter to continue',
                ),
                OtpInput(
                  length: 4,
                  onChanged: (otp) {
                    setState(() => _otp = otp);
                  },
                  onCompleted: (otp) {
                    setState(() => _otp = otp);
                    if (otp.length == 4) {
                      AppRouter.push(
                        MaterialPageRoute(
                          builder: (_) => ResetPasswordScreen(
                            email: widget.email,
                            otp: otp,
                          ),
                        ),
                      );
                    }
                  },
                ),
                Button(
                  'Continue',
                  onPressed: _otp.length == 4
                      ? () {
                          AppRouter.push(
                            MaterialPageRoute(
                              builder: (_) => ResetPasswordScreen(
                                email: widget.email,
                                otp: _otp,
                              ),
                            ),
                          );
                        }
                      : null,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't receive code? ",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton(
                      onPressed: () {
                        // context.read<AuthCubit>().sendPasswordResetOtp(
                        //   widget.email,
                        // );
                      },
                      child: const Text('Resend'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
