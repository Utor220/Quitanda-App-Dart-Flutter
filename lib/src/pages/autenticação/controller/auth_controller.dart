import 'package:get/get.dart';
import 'package:quitanda_app/src/pages/autentica%C3%A7%C3%A3o/repository/auth_repository.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();

  Future<void> login({required String email, required String password}) async {
    isLoading.value = true;
    await authRepository.login(
      email: email,
      password: password,
    );
    isLoading.value = false;
  }
}
