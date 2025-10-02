import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_services_app/features/auth/domain/usecases/user_onboarding_usecase.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final UserOnboardingUsecase _userOnboardingUsecase;
  OnboardingCubit({required UserOnboardingUsecase userOnboardingUsecase})
    : _userOnboardingUsecase = userOnboardingUsecase,
      super(const OnboardingState());

  void setRole(String role) {
    emit(state.copyWith(selectedRole: role));
  }

  void setServices(List<String> services) {
    emit(state.copyWith(selectedServices: services));
  }

  void setCustomService(String service) {
    emit(state.copyWith(customService: service));
  }

  void updateProfile({
    required String phoneNumber,
    required String dob,
    required String stateValue,
    required String cityTown,
    required String houseAddress,
    required String bioDescription,
  }) {
    emit(
      state.copyWith(
        phoneNumber: phoneNumber,
        dob: dob,
        state: stateValue,
        cityTown: cityTown,
        houseAddress: houseAddress,
        bioDescription: bioDescription,
      ),
    );
  }

  Map<String, dynamic> getOnboardingData() {
    return {
      'role': state.selectedRole,
      'services': state.selectedServices,
      'customService': state.customService,
      'phoneNumber': state.phoneNumber,
      'dob': state.dob,
      'state': state.state,
      'cityTown': state.cityTown,
      'houseAddress': state.houseAddress,
      'bioDescription': state.bioDescription,
    };
  }

  void completeUserOnboarding(UserOnboardingParams params) async {
    emit(OnboardingLoading());
    final response = await _userOnboardingUsecase(params);

    response.fold(
      (l) {
        emit(OnboardingFailure(l.message));
      },
      (r) {
        emit(OnboardingSuccess());
      },
    );
  }

  void reset() {
    emit(const OnboardingState());
  }
}
