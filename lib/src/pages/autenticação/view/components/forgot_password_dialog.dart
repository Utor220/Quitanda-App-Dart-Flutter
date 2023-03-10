import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda_app/src/config/custom_colors.dart';
import 'package:quitanda_app/src/pages/autentica%C3%A7%C3%A3o/controller/auth_controller.dart';
import 'package:quitanda_app/src/pages/common_widgets/textfield_style.dart';
import 'package:quitanda_app/src/services/validators.dart';

class ForgotPasswordDialog extends StatelessWidget {
  final emailController = TextEditingController();

  ForgotPasswordDialog({
    required String email,
    Key? key,
  }) : super(key: key) {
    emailController.text = email;
  }

  final _formFieldKey = GlobalKey<FormFieldState>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Conteúdo
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Titulo
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Recuperação de senha',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),

                // Descrição
                const Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 20,
                  ),
                  child: Text(
                    'Digite seu email para recuperar sua senha',
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                ),

                // Campo de email
                TextFieldFormStyle(
                  formFieldKey: _formFieldKey,
                  controller: emailController,
                  tfIcone: Icons.email,
                  tfLabel: 'Email',
                  validator: emailValidator,
                ),

                // Confirmar
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    side: BorderSide(
                      width: 2,
                      color: CustomColors.customSwatchColor,
                    ),
                  ),
                  onPressed: () {
                    if (_formFieldKey.currentState!.validate()) {
                      authController.resetPassword(emailController.text);
                      Get.back(result: true);
                    }
                  },
                  child: const Text(
                    'Recuperar',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Botão para fechar
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}
