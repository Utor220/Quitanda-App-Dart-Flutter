import 'package:flutter/material.dart';
import 'package:quitanda_app/src/Config/custom_colors.dart';

import 'src/pages/Autenticação/tela_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: CustomColors.customSwatchColor,
          scaffoldBackgroundColor: Colors.white.withAlpha(190)),
      debugShowCheckedModeBanner: false,
      home: const TelaLogin(),
    );
  }
}
