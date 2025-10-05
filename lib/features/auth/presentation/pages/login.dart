import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_services_app/core/theme/colors.dart';
import 'package:trust_services_app/core/utils/app_router.dart';
import 'package:trust_services_app/core/utils/toast.dart';
import 'package:trust_services_app/core/widgets/app_sub_heading.dart';
import 'package:trust_services_app/core/widgets/button.dart';
import 'package:trust_services_app/core/widgets/checkbox_input.dart';
import 'package:trust_services_app/core/widgets/scaffold_title.dart';
import 'package:trust_services_app/core/widgets/text_input.dart';
import 'package:trust_services_app/features/auth/domain/usecases/login_user_usecase.dart';
import 'package:trust_services_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:trust_services_app/features/auth/presentation/pages/forgot_password.dart';
import 'package:trust_services_app/features/auth/presentation/widgets/google_button.dart';
import 'package:trust_services_app/features/dashboard/presentation/widgets/dashboard_tabs.dart';

class LoginScreen extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (ctx) => LoginScreen());
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _checkedState = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          Toast.error(context, state.message);
        }

        if (state is AuthSuccess) {
          AppRouter.pushAndRemoveUntil(DashboardTabs.route(), false);
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;
        return Scaffold(
          appBar: AppBar(title: ScaffoldTitle('Login to your account')),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Form(
                key: _formkey,
                child: Column(
                  spacing: 24,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSubHeading('Enter your details below to login'),
                    TextInput(
                      label: 'Email Address',
                      hintText: '@gmail.com',
                      controller: _emailController,
                      type: TextInputTypes.email,
                    ),
                    TextInput(
                      label: 'Password',
                      hintText: '**********',
                      controller: _passwordController,
                      obscureText: true,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CheckboxInput(
                            'Remember Me',
                            checkedState: _checkedState,
                            onChange: (state) {
                              setState(() {
                                _checkedState = state;
                              });
                            },
                          ),
                        ),
                        InkWell(
                          onTap: () =>
                              AppRouter.push(ForgotPasswordScreen.route()),
                          child: Text(
                            'Forgot Password?',
                            style: Theme.of(context).textTheme.labelSmall!
                                .copyWith(
                                  color: AppPallete.primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Button(
                      'Login',
                      isProcessing: isLoading,
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          context.read<AuthCubit>().login(
                            LoginUserParams(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                            ),
                          );
                        }
                      },
                    ),
                    GoogleButton(),
                    InkWell(
                      onTap: () {},
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style: Theme.of(context).textTheme.labelSmall!
                                .copyWith(fontWeight: FontWeight.w500),
                            children: [
                              TextSpan(
                                text: 'Sign Up',
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
