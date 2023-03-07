import 'package:get/get.dart';
import 'package:quitanda_app/src/pages/base/tela_base.dart';
import 'package:quitanda_app/src/pages/splash/splash_screen.dart';
import '../pages/autenticação/view/tela_cadastro.dart';
import '../pages/autenticação/view/tela_login.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoute.splashRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: PagesRoute.loginRoute,
      page: () => TelaLogin(),
    ),
    GetPage(
      name: PagesRoute.cadastroRoute,
      page: () => TelaCadastro(),
    ),
    GetPage(name: PagesRoute.baseRoute, page: () => const TelaBase()),
  ];
}

abstract class PagesRoute {
  static const String loginRoute = "/login";
  static const String cadastroRoute = "/cadastro";
  static const String splashRoute = "/splash";
  static const String baseRoute = "/";
}
