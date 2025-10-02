import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trust_services_app/core/theme/colors.dart';
import 'package:trust_services_app/core/widgets/app_sub_heading.dart';
import 'package:trust_services_app/core/widgets/button.dart';
import 'package:trust_services_app/core/widgets/scaffold_title.dart';
import 'package:trust_services_app/core/widgets/text_input.dart';
import 'package:trust_services_app/features/auth/domain/usecases/user_onboarding_usecase.dart';
import 'package:trust_services_app/features/auth/presentation/cubit/onboarding_cubit.dart';

class ConnectScreen extends StatefulWidget {
  final VoidCallback onNextPage;
  final VoidCallback onPrevPage;
  const ConnectScreen({
    super.key,
    required this.onNextPage,
    required this.onPrevPage,
  });

  @override
  State<ConnectScreen> createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {
  final _formKey = GlobalKey<FormState>();

  final _phoneController = TextEditingController();
  final _dobController = TextEditingController();
  final _stateController = TextEditingController();
  final _cityController = TextEditingController();
  final _addressController = TextEditingController();
  final _shortBioController = TextEditingController();

  bool _autoValidate = false;

  bool get _isFormValid =>
      _phoneController.text.isNotEmpty &&
      _dobController.text.isNotEmpty &&
      _stateController.text.isNotEmpty &&
      _cityController.text.isNotEmpty &&
      _addressController.text.isNotEmpty &&
      _shortBioController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    final state = context.read<OnboardingCubit>().state;

    _phoneController.text = state.phoneNumber;
    _dobController.text = state.dob;
    _stateController.text = state.state;
    _cityController.text = state.cityTown;
    _addressController.text = state.houseAddress;
    _shortBioController.text = state.bioDescription;

    for (final controller in [
      _phoneController,
      _dobController,
      _stateController,
      _cityController,
      _addressController,
      _shortBioController,
    ]) {
      controller.addListener(() {
        setState(() {});
        if (_autoValidate) {
          _formKey.currentState?.validate();
        }
      });
    }
  }

  @override
  void dispose() {
    for (final controller in [
      _phoneController,
      _dobController,
      _stateController,
      _cityController,
      _addressController,
      _shortBioController,
    ]) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 18, now.month, now.day),
      firstDate: DateTime(1900),
      lastDate: DateTime(now.year - 10, now.month, now.day),
    );

    if (pickedDate != null) {
      _dobController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }

  void _onFinish() {
    setState(() => _autoValidate = true);

    if (_formKey.currentState!.validate()) {
      final onboarding = context.read<OnboardingCubit>();

      onboarding.updateProfile(
        phoneNumber: _phoneController.text.trim(),
        dob: _dobController.text.trim(),
        stateValue: _stateController.text.trim(),
        cityTown: _cityController.text.trim(),
        houseAddress: _addressController.text.trim(),
        bioDescription: _shortBioController.text.trim(),
      );
      final state = onboarding.state;

      onboarding.completeUserOnboarding(
        UserOnboardingParams(
          role: state.selectedRole as String,
          customService: state.customService,
          services: state.selectedServices,
          phone: state.phoneNumber,
          dob: state.dob,
          state: state.state,
          city: state.cityTown,
          address: state.houseAddress,
          shortBio: state.bioDescription,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        if (state is OnboardingSuccess) {
          widget.onNextPage();
        }
      },
      builder: (context, state) {
        final isLoading = state is OnboardingLoading;

        return Scaffold(
          appBar: AppBar(
            title: const ScaffoldTitle('Let’s get to connect'),
            leading: InkWell(
              onTap: widget.onPrevPage,
              overlayColor: WidgetStatePropertyAll(AppPallete.transparentColor),
              child: const Icon(CupertinoIcons.chevron_left, weight: 600),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Form(
                key: _formKey,
                autovalidateMode: _autoValidate
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: Column(
                  spacing: 12,
                  children: [
                    const AppSubHeading(
                      'We’d like to collect some details about you. This will help tailor contents for you',
                    ),
                    TextInput(
                      label: "Phone Number",
                      hintText: '+234....',
                      controller: _phoneController,
                      type: TextInputTypes.phone,
                    ),
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child: AbsorbPointer(
                        child: TextInput(
                          label: "Date of Birth",
                          hintText: 'DOB',
                          controller: _dobController,
                          type: TextInputTypes.datetime,
                        ),
                      ),
                    ),
                    TextInput(
                      label: "State of Origin",
                      hintText: 'State',
                      controller: _stateController,
                    ),
                    TextInput(
                      label: "City/Town",
                      hintText: 'City',
                      controller: _cityController,
                    ),
                    TextInput(
                      label: "House Address",
                      hintText: 'Address',
                      controller: _addressController,
                    ),
                    TextInput(
                      label: "Short Bio",
                      hintText: 'Description...',
                      controller: _shortBioController,
                      maxLines: 3,
                    ),
                    const SizedBox(height: 24),
                    Button(
                      'Finish Set Up',
                      isProcessing: isLoading,
                      onPressed: _isFormValid || _autoValidate
                          ? _onFinish
                          : null,
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
