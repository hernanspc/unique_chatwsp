import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unique_chatwsp/feature/auth/repository/auth_repository.dart';

final authControllerProvider = Provider(
  (ref) {
    final authRespository = ref.watch(authRepositoryProvider);
    return AuthController(authRepository: authRespository);
  },
);

class AuthController {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

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
