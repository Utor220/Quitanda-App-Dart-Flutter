import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda_app/src/Config/custom_colors.dart';
import 'package:quitanda_app/src/pages_routes/app_pages.dart';
import 'src/pages/autenticação/controller/auth_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mercado Lunar',
      theme: ThemeData(
          primarySwatch: CustomColors.customSwatchColor,
          scaffoldBackgroundColor: Colors.white.withAlpha(190)),
      debugShowCheckedModeBanner: false,
      initialRoute: PagesRoute.splashRoute,
      getPages: AppPages.pages,
    );
  }
}
