import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quitanda_app/src/config/custom_colors.dart';

import 'Componentes/textfield_style.dart';

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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const TextFieldFormStyle(
                          tfIcone: Icons.person,
                          tfLabel: 'Nome',
                        ),
                        TextFieldFormStyle(
                          tfIcone: Icons.file_copy,
                          tfLabel: 'CPF',
                          inputFormatters: [cpfFormatter],
                        ),
                        TextFieldFormStyle(
                          tfIcone: Icons.phone,
                          tfLabel: 'Celular',
                          inputFormatters: [celFormatter],
                        ),
                        const TextFieldFormStyle(
                          tfIcone: Icons.email,
                          tfLabel: 'Email',
                        ),
                        const TextFieldFormStyle(
                          tfIcone: Icons.lock,
                          tfLabel: 'Senha',
                          isSecret: true,
                        ),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Cadastrar',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
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
