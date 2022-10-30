import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:quitanda_app/src/config/custom_colors.dart';
import '../Base/tela_base.dart';
import 'Componentes/textfield_style.dart';
import 'tela_cadastro.dart';

class TelaLogin extends StatelessWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Variável com o valor das dimensões da tela do aparelho
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        //Ao envolver uma Column que contém TextFields em um SizedBox com tamanhos definidos e depois envolve este SizedBox em um SingleChildScrollView, cria-se um efeito de rolagem da tela
        child: SizedBox(
          //Definindo altura do SizedBox para a altura do aparelho
          height: deviceSize.height,
          //Definindo largura do SizedBox para a largura do aparelho
          width: deviceSize.width,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Titulo do app
                    Text.rich(
                      TextSpan(
                        style: const TextStyle(
                          fontSize: 40,
                        ),
                        children: [
                          const TextSpan(
                            text: 'Mercado',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'Lunar',
                            style: TextStyle(
                              color: CustomColors.customContrastColor,
                            ),
                          )
                        ],
                      ),
                    ),

                    //Subtítulo
                    SizedBox(
                      height: 30,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        child: AnimatedTextKit(
                          pause: Duration.zero,
                          repeatForever: true,
                          animatedTexts: [
                            FadeAnimatedText('Delivery'),
                            FadeAnimatedText('Aberto 24 horas'),
                            FadeAnimatedText('Peça Já'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              //Formulário
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 35,
                ),
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //Email
                      const TextFieldFormStyle(
                        tfIcone: Icons.email,
                        tfLabel: 'Email',
                      ),

                      //Senha
                      const TextFieldFormStyle(
                        tfIcone: Icons.lock,
                        tfLabel: 'Senha',
                        isSecret: true,
                      ),

                      //Botão de Entrar
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (c) {
                                  return const TelaBase();
                                },
                              ),
                            );
                          },
                          child: const Text(
                            'Entrar',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),

                      //Esqueçeu a senha
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Esqueçeu a senha?',
                            style: TextStyle(
                              color: CustomColors.customContrastColor,
                            ),
                          ),
                        ),
                      ),

                      //Divisor
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.lightBlueAccent.withAlpha(90),
                                thickness: 2,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Text(
                                'Ou',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.lightBlueAccent.withAlpha(90),
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                      ),

                      //Botão de cadastro
                      SizedBox(
                        height: 50,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            side: BorderSide(
                              width: 2,
                              color: CustomColors.customContrastColor,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (c) {
                                  return TelaCadastro();
                                },
                              ),
                            );
                          },
                          child: const Text(
                            'Criar conta',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
