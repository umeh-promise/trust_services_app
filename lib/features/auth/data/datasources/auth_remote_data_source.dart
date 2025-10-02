import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trust_services_app/core/errors/exception.dart';
import 'package:trust_services_app/features/auth/data/model/user_model.dart';
import 'package:trust_services_app/features/auth/domain/usecases/login_user_usecase.dart';
import 'package:trust_services_app/features/auth/domain/usecases/user_onboarding_usecase.dart';
import 'package:trust_services_app/features/auth/domain/usecases/user_signup_usecase.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> loginWithEmailPassword(LoginUserParams params);
  Future<UserModel> signUpWithEmailPassword(SignupParams params);

  Future<UserModel> completeUserOnboarding(UserOnboardingParams params);

  Future<UserModel?> getCurrentUserData();

  Session? get currentUserSession;

  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Session? get currentUserSession => supabaseClient.auth.currentSession;

  @override
  Future<UserModel> signUpWithEmailPassword(SignupParams params) async {
    try {
      final response = await supabaseClient.auth.signUp(
        email: params.email,
        password: params.password,
        data: {'name': params.name},
      );
      if (response.user == null) {
        throw ServerException('Server error');
      }
      return UserModel.fromJson(response.user!.toJson());
    } on AuthApiException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<UserModel> completeUserOnboarding(UserOnboardingParams params) async {
    try {
      final response = await supabaseClient
          .from('profiles')
          .update({
            'phone': params.phone,
            'role': params.role,
            'services': params.services,
            'dob': params.dob,
            'city': params.city,
            'address': params.address,
            'short_bio': params.shortBio,
            'custom_service': params.customService,
          })
          .eq('id', currentUserSession!.user.id)
          .select()
          .single();

      if (response.isEmpty) {
        throw ServerException('Server error');
      }

      return UserModel.fromJson(response);
    } catch (e) {
      throw ServerException('$e');
    }
  }

  @override
  Future<UserModel?> getCurrentUserData() async {
    if (currentUserSession == null) {
      return null;
    }
    try {
      final userData = await supabaseClient
          .from('profiles')
          .select()
          .eq('id', currentUserSession!.user.id)
          .single();

      return UserModel.fromJson(
        userData,
      ).copyWith(email: currentUserSession!.user.email);
    } on AuthApiException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<UserModel> loginWithEmailPassword(LoginUserParams params) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        password: params.password,
        email: params.email,
      );
      if (response.user == null) {
        throw ServerException('Server error');
      }
      return UserModel.fromJson(response.user!.toJson());
    } on AuthApiException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<void> logout() async {
    try {
      return await supabaseClient.auth.signOut();
    } on AuthApiException catch (e) {
      throw ServerException(e.message);
    }
  }
}
