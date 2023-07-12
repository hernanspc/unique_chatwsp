import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unique_chatwsp/common/models/user_model.dart';
import 'package:unique_chatwsp/feature/auth/repository/auth_repository.dart';

final authControllerProvider = Provider(
  (ref) {
    final authRespository = ref.watch(authRepositoryProvider);
    return AuthController(authRepository: authRespository, ref: ref);
  },
);

final userInfoAuthProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider);

  return authController.getCurrentUserInfo();
});

class AuthController {
  final AuthRepository authRepository;
  final ProviderRef ref;

  AuthController({required this.authRepository, required this.ref});

  Future<UserModel?> getCurrentUserInfo() async {
    UserModel? user = await authRepository.getCurrentUserInfo();
    return user;
  }

  void saveUserInfoToFirestore({
    required String username,
    required var profileImage,
    required BuildContext context,
    required bool mounted,
  }) {
    authRepository.saveUserInfoToFirestore(
      username: username,
      profileImage: profileImage,
      ref: ref,
      context: context,
      mounted: mounted,
    );
  }

  void verifySmsCode({
    required BuildContext context,
    required String smsCodeId,
    required String smsCode,
    required bool mounted,
  }) {
    authRepository.verifySmsCode(
      context: context,
      smsCodeId: smsCodeId,
      smsCode: smsCode,
      mounted: mounted,
    );
  }

  void sendSmsCode({
    required BuildContext context,
    required String phoneNumber,
  }) {
    authRepository.sendSmsCode(
      context: context,
      phoneNumber: phoneNumber,
    );
  }
}
