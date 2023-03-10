import 'package:get/get.dart';
import 'package:quitanda_app/src/constants/storage_keys.dart';
import 'package:quitanda_app/src/models/user_model.dart';
import 'package:quitanda_app/src/pages/autentica%C3%A7%C3%A3o/repository/auth_repository.dart';
import 'package:quitanda_app/src/pages_routes/app_pages.dart';
import 'package:quitanda_app/src/services/utils_services.dart';

import '../result/auth_result.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();
  final utilsServices = UtilsServices();
  UserModel user = UserModel();

  @override
  void onInit() {
    super.onInit();

    validateToken();
  }

  Future<void> validateToken() async {
    String? token = await utilsServices.getLocalData(key: StorageKeys.token);

    if (token == null) {
      Get.offAllNamed(PagesRoute.loginRoute);
      return;
    } else {
      AuthResult result = await authRepository.validateToken(token);

      result.when(success: (user) {
        this.user = user;
        saveTokenAndProceedToBase();
      }, error: (message) {
        logOut();
      });
    }
  }

  Future<void> resetPassword(String email) async {
    await authRepository.resetPassword(email);
  }

  Future<void> logOut() async {
    user = UserModel();
    await utilsServices.removeLocalData(key: StorageKeys.token);
    Get.offAllNamed(PagesRoute.loginRoute);
  }

  void saveTokenAndProceedToBase() {
    utilsServices.saveLocalData(key: StorageKeys.token, data: user.token!);
    Get.offAllNamed(PagesRoute.baseRoute);
  }

  Future<void> cadastro() async {
    isLoading.value = true;

    AuthResult result = await authRepository.cadastro(user);

    isLoading.value = false;

    result.when(
      success: (user) {
        this.user = user;
        saveTokenAndProceedToBase();
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }

  Future<void> login({required String email, required String password}) async {
    isLoading.value = true;
    AuthResult result = await authRepository.login(
      email: email,
      password: password,
    );
    isLoading.value = false;

    result.when(
      success: (user) {
        this.user = user;
        saveTokenAndProceedToBase();
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }
}
