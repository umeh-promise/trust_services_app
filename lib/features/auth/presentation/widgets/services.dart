import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_services_app/core/theme/colors.dart';
import 'package:trust_services_app/core/widgets/app_sub_heading.dart';
import 'package:trust_services_app/core/widgets/button.dart';
import 'package:trust_services_app/core/widgets/custom_app_bar.dart';
import 'package:trust_services_app/core/widgets/scaffold_title.dart';
import 'package:trust_services_app/features/auth/presentation/cubit/onboarding_cubit.dart';

class ServicesScreen extends StatefulWidget {
  final VoidCallback onNextPage;
  final VoidCallback onPrevPage;
  const ServicesScreen({
    super.key,
    required this.onNextPage,
    required this.onPrevPage,
  });

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  List<String> _selectedServices = [];
  String? _customService;

  @override
  void initState() {
    final state = context.read<OnboardingCubit>().state;
    _selectedServices = List<String>.from(state.selectedServices);
    _customService = state.customService.isNotEmpty
        ? state.customService
        : null;
    super.initState();
  }

  bool get _isContinueEnabled =>
      _selectedServices.isNotEmpty || (_customService?.isNotEmpty ?? false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Let’s go!', onTap: widget.onPrevPage),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                AppSubHeading(
                  'Let’s get to know the kind of services that you’ll be providing',
                ),

                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    ...[
                      'Plumbing',
                      'Electrician',
                      'Hairstylist',
                      'House painting',
                      'Office/house decoration',
                      'Haircut',
                      'Event planning/management',
                    ].map(
                      (service) => GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_selectedServices.contains(service)) {
                              _selectedServices.remove(service);
                            } else {
                              _selectedServices.add(service);
                            }
                            context.read<OnboardingCubit>().setServices(
                              _selectedServices,
                            );
                          });
                        },
                        child: Chip(
                          label: Text(service),
                          backgroundColor: AppPallete.grey100,
                          labelStyle: Theme.of(context).textTheme.labelSmall!
                              .copyWith(
                                color: _selectedServices.contains(service)
                                    ? AppPallete.whiteColor
                                    : null,
                                fontWeight: FontWeight.bold,
                              ),
                          color: _selectedServices.contains(service)
                              ? WidgetStatePropertyAll(AppPallete.primaryColor)
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),

                TextField(
                  decoration: InputDecoration(label: Text('Others? Specify')),
                  onChanged: (value) {
                    setState(() {
                      _customService = value;
                      context.read<OnboardingCubit>().setCustomService(value);
                    });
                  },
                ),
              ],
            ),
            Button(
              'Continue',
              onPressed: _isContinueEnabled ? widget.onNextPage : null,
            ),
          ],
        ),
      ),
    );
  }
}
