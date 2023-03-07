import 'package:quitanda_app/src/constants/endpoints.dart';
import 'package:quitanda_app/src/models/user_model.dart';
import 'package:quitanda_app/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future login({
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

    if (result["result"] != null) {
      final user = UserModel.fromMap(result['result']);
    } else {}
  }
}
