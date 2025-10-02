part of 'onboarding_cubit.dart';

class OnboardingState extends Equatable {
  final String? selectedRole;
  final List<String> selectedServices;
  final String customService;
  final String phoneNumber;
  final String dob;
  final String state;
  final String cityTown;
  final String houseAddress;
  final String bioDescription;

  const OnboardingState({
    this.selectedRole,
    this.selectedServices = const [],
    this.customService = '',
    this.phoneNumber = '',
    this.dob = '',
    this.state = '',
    this.cityTown = '',
    this.houseAddress = '',
    this.bioDescription = '',
  });

  OnboardingState copyWith({
    String? selectedRole,
    List<String>? selectedServices,
    String? customService,
    String? phoneNumber,
    String? dob,
    String? state,
    String? cityTown,
    String? houseAddress,
    String? bioDescription,
  }) {
    return OnboardingState(
      selectedRole: selectedRole ?? this.selectedRole,
      selectedServices: selectedServices ?? this.selectedServices,
      customService: customService ?? this.customService,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dob: dob ?? this.dob,
      state: state ?? this.state,
      cityTown: cityTown ?? this.cityTown,
      houseAddress: houseAddress ?? this.houseAddress,
      bioDescription: bioDescription ?? this.bioDescription,
    );
  }

  @override
  List<Object?> get props => [
    selectedRole,
    selectedServices,
    customService,
    phoneNumber,
    dob,
    state,
    cityTown,
    houseAddress,
    bioDescription,
  ];
}

final class OnboardingLoading extends OnboardingState {}

final class OnboardingSuccess extends OnboardingState {}

final class OnboardingFailure extends OnboardingState {
  final String message;

  const OnboardingFailure(this.message);
}
