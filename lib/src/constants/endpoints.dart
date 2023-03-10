const String baseUrl = "https://parseapi.back4app.com/functions";

abstract class Endpoints {
  static const String login = "$baseUrl/login";
  static const String cadastro = "$baseUrl/signup";
  static const String validateToken = "$baseUrl/validate-token";
  static const String resetPassword = "$baseUrl/reset-password";
}
