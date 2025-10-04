import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_services_app/core/theme/colors.dart';
import 'package:trust_services_app/core/theme/sizes.dart';
import 'package:trust_services_app/core/widgets/app_sub_heading.dart';
import 'package:trust_services_app/core/widgets/button.dart';
import 'package:trust_services_app/core/widgets/scaffold_title.dart';
import 'package:trust_services_app/features/auth/presentation/cubit/onboarding_cubit.dart';

final _roles = [
  {'label': 'Client', 'value': 'client'},
  {'label': 'Service Provider', 'value': 'serviceProvider'},
];

class WelcomeScreen extends StatefulWidget {
  final VoidCallback onNextPage;
  const WelcomeScreen({super.key, required this.onNextPage});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String? _selectedRole;

  @override
  void initState() {
    super.initState();
    final role = context.read<OnboardingCubit>().state.selectedRole;
    _selectedRole = role?.isNotEmpty == true ? role : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: ScaffoldTitle('Welcome!')),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 16,
          children: [
            Column(
              spacing: 16,
              children: [
                AppSubHeading(
                  'Let’s get started by collecting some information about you and how to serve you better.',
                ),
                DropdownMenu(
                  onSelected: (value) {
                    setState(() {
                      _selectedRole = value!;
                      context.read<OnboardingCubit>().setRole(value);
                    });
                  },
                  initialSelection: _selectedRole,
                  width: double.infinity,
                  inputDecorationTheme: InputDecorationTheme(
                    fillColor: AppPallete.grey100,
                    filled: true,
                  ),
                  trailingIcon: Icon(CupertinoIcons.chevron_right, size: 24),
                  selectedTrailingIcon: Icon(
                    CupertinoIcons.chevron_up,
                    size: 24,
                  ),
                  hintText: 'What’s your role?',
                  menuStyle: MenuStyle(
                    backgroundColor: WidgetStatePropertyAll(AppPallete.grey50),
                    elevation: WidgetStatePropertyAll(6),
                    fixedSize: WidgetStatePropertyAll(
                      Size(MediaQuery.of(context).size.width - 40, double.nan),
                    ),
                  ),
                  textStyle: Theme.of(
                    context,
                  ).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w600),
                  dropdownMenuEntries: [
                    for (final role in _roles)
                      DropdownMenuEntry(
                        value: role['value'],
                        label: role['label']!,
                        style: ButtonStyle(
                          textStyle: WidgetStatePropertyAll(
                            Theme.of(context).textTheme.labelLarge,
                          ),
                          foregroundColor: WidgetStatePropertyAll(
                            Colors.black87,
                          ),
                          padding: WidgetStatePropertyAll(
                            EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: Sizes.base,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
            Button(
              'Continue',
              onPressed: _selectedRole == null ? null : widget.onNextPage,
            ),
          ],
        ),
      ),
    );
  }
}
