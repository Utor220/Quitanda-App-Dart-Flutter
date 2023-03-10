import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quitanda_app/src/config/custom_colors.dart';
import 'package:quitanda_app/src/pages/autentica%C3%A7%C3%A3o/controller/auth_controller.dart';
import 'package:quitanda_app/src/pages/common_widgets/textfield_style.dart';
import 'package:quitanda_app/src/services/validators.dart';

class TelaCadastro extends StatelessWidget {
  TelaCadastro({Key? key}) : super(key: key);

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {
      '#': RegExp(r'[0-9]'),
    },
  );

  final celFormatter = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {
      '#': RegExp(r'[0-9]'),
    },
  );

  final _formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    //Variável com o valor das dimensões da tela do aparelho
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: deviceSize.height,
          width: deviceSize.width,
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Cadastro',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  //Formulário
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 35,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(45),
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFieldFormStyle(
                            tfIcone: Icons.person,
                            tfLabel: 'Nome',
                            validator: nameValidator,
                            onSaved: (value) {
                              authController.user.name = value;
                              return null;
                            },
                          ),
                          TextFieldFormStyle(
                            tfIcone: Icons.file_copy,
                            tfLabel: 'CPF',
                            textInputType: TextInputType.number,
                            inputFormatters: [cpfFormatter],
                            validator: cpfValidator,
                            onSaved: (value) {
                              authController.user.cpf = value;
                              return null;
                            },
                          ),
                          TextFieldFormStyle(
                            tfIcone: Icons.phone,
                            tfLabel: 'Celular',
                            textInputType: TextInputType.phone,
                            inputFormatters: [celFormatter],
                            validator: phoneValidator,
                            onSaved: (value) {
                              authController.user.phone = value;
                              return null;
                            },
                          ),
                          TextFieldFormStyle(
                            tfIcone: Icons.email,
                            tfLabel: 'Email',
                            textInputType: TextInputType.emailAddress,
                            validator: emailValidator,
                            onSaved: (value) {
                              authController.user.email = value;
                              return null;
                            },
                          ),
                          TextFieldFormStyle(
                            tfIcone: Icons.lock,
                            tfLabel: 'Senha',
                            isSecret: true,
                            validator: passwordValidator,
                            onSaved: (value) {
                              authController.user.password = value;
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 50,
                            child: Obx(() => ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  onPressed: authController.isLoading.value
                                      ? null
                                      : () {
                                          FocusScope.of(context).unfocus();
                                          if (_formKey.currentState!
                                              .validate()) {
                                            _formKey.currentState!.save();

                                            authController.cadastro();
                                          }
                                        },
                                  child: authController.isLoading.value
                                      ? const CircularProgressIndicator()
                                      : const Text(
                                          'Cadastrar',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 10,
                left: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
