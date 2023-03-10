import 'package:quitanda_app/src/constants/endpoints.dart';
import 'package:quitanda_app/src/models/user_model.dart';
import 'package:quitanda_app/src/pages/autentica%C3%A7%C3%A3o/repository/auth_errors.dart'
    as authErrors;
import 'package:quitanda_app/src/pages/autentica%C3%A7%C3%A3o/result/auth_result.dart';
import 'package:quitanda_app/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  AuthResult handleUserOrError(Map<dynamic, dynamic> result) {
    if (result["result"] != null) {
      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(authErrors.authErrorsString(result['error']));
    }
  }

  Future<AuthResult> validateToken(String token) async {
    final result = await _httpManager.restRequest(
      method: HttpMethod.post,
      url: Endpoints.validateToken,
      headers: {
        'X-Parse-Session-Token': token,
      },
    );

    return handleUserOrError(result);
  }

  Future<AuthResult> login({
    required String email,
    required String password,
  }) async {
    final result = await _httpManager.restRequest(
      method: HttpMethod.post,
      url: Endpoints.login,
      body: {
        "email": email,
        "password": password,
      },
    );

    return handleUserOrError(result);
  }

  Future<AuthResult> cadastro(UserModel user) async {
    final result = await _httpManager.restRequest(
      method: HttpMethod.post,
      url: Endpoints.cadastro,
      body: user.toJson(),
    );

    return handleUserOrError(result);
  }

  Future<void> resetPassword(String email) async {
    await _httpManager.restRequest(
      method: HttpMethod.post,
      url: Endpoints.resetPassword,
      body: {'email': email},
    );
  }
}
