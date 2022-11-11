import 'package:flutter/material.dart';
import 'package:quitanda_app/src/pages/common_widgets/textfield_style.dart';
import 'package:quitanda_app/src/Config/app_data.dart' as appData;

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Usuário'),
        actions: [
          //Botão de LogOut
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          //e-Mail
          TextFieldFormStyle(
            initialValue: appData.user.email,
            tfIcone: Icons.email,
            tfLabel: 'e-Mail',
            readOnly: true,
          ),

          //Nome
          TextFieldFormStyle(
            initialValue: appData.user.nome,
            tfIcone: Icons.person,
            tfLabel: 'Nome',
            readOnly: true,
          ),

          //Celular
          TextFieldFormStyle(
            initialValue: appData.user.celular,
            tfIcone: Icons.phone,
            tfLabel: 'Celular',
            readOnly: true,
          ),

          //CPF
          TextFieldFormStyle(
            initialValue: appData.user.cpf,
            tfIcone: Icons.file_copy,
            tfLabel: 'CPF',
            isSecret: true,
            readOnly: true,
          ),

          //Botão pra atualizar a senha
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: Colors.yellow.shade600,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                updatePassword();
              },
              child: const Text('Atualizar senha'),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
      context: context,
      builder: (constext) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //Título do Dialog
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Atualização de senha',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    //Senha atual
                    const TextFieldFormStyle(
                      tfIcone: Icons.lock,
                      tfLabel: 'Senha Atual',
                      isSecret: true,
                    ),
                    //Nova Senha
                    const TextFieldFormStyle(
                      tfIcone: Icons.lock_outline,
                      tfLabel: 'Nova Senha',
                      isSecret: true,
                    ),
                    //Confirmação Nova Senha
                    const TextFieldFormStyle(
                      tfIcone: Icons.lock_outline,
                      tfLabel: 'Confirmar nova senha',
                      isSecret: true,
                    ),
                    //Botão de confirmação
                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('Atualizar'),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
