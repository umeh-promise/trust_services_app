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
import 'package:trust_services_app/features/auth/domain/usecases/user_signup_usecase.dart';
import 'package:trust_services_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:trust_services_app/features/auth/presentation/pages/login.dart';
import 'package:trust_services_app/features/auth/presentation/pages/onboarding.dart';
import 'package:trust_services_app/features/auth/presentation/widgets/google_button.dart';

class SignupScreen extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (ctx) => SignupScreen());
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _checkedState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: ScaffoldTitle('Create account')),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            Toast.error(context, state.message);
          }
          if (state is AuthSuccess) {
            AppRouter.pushAndRemoveUntil(OnboardingFlow.route(), false);
          }
        },
        builder: (context, state) {
          final isLoading = state is AuthLoading;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Form(
                key: _formkey,
                child: Column(
                  spacing: 24,
                  children: [
                    AppSubHeading(
                      'Enter your details below to create account with us today',
                    ),
                    TextInput(
                      label: 'Name',
                      hintText: 'Enter full name',
                      controller: _nameController,
                    ),
                    TextInput(
                      label: 'Email Address',
                      hintText: '@gmail.com',
                      controller: _emailController,
                    ),
                    TextInput(
                      label: 'Password',
                      hintText: '**********',
                      controller: _passwordController,
                      obscureText: true,
                    ),
                    CheckboxInput(
                      'By clicking, you agree to the Terms and Conditions of our service',
                      checkedState: _checkedState,
                      onChange: (state) {
                        setState(() {
                          _checkedState = state;
                        });
                      },
                    ),

                    Button(
                      'Sign Up Now',
                      isProcessing: isLoading,
                      onPressed: () {
                        if (_formkey.currentState!.validate() &&
                            _checkedState) {
                          context.read<AuthCubit>().signup(
                            SignupParams(
                              name: _nameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                              agreeTerms: _checkedState,
                            ),
                          );
                        }
                      },
                    ),
                    GoogleButton(),
                    InkWell(
                      onTap: () => AppRouter.push(LoginScreen.route()),
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: Theme.of(context).textTheme.labelSmall!
                              .copyWith(fontWeight: FontWeight.w500),
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
      ),
    );
  }
}
