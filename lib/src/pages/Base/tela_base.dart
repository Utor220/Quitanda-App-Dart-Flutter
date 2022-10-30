import 'package:flutter/material.dart';
import 'package:quitanda_app/src/config/custom_colors.dart';
import 'package:quitanda_app/src/pages/cart/cart_tab.dart';

import '../home/menu_inicial_tab.dart';

class TelaBase extends StatefulWidget {
  const TelaBase({Key? key}) : super(key: key);

  @override
  State<TelaBase> createState() => _TelaBaseState();
}

class _TelaBaseState extends State<TelaBase> {
  int indexAtual = 0;
  final controladorPagina = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Páginas do app
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controladorPagina,
        children: [
          const MenuInicialTab(),
          CartTab(),
          Container(color: Colors.green),
          Container(color: Colors.tealAccent),
        ],
      ),

      //Menu de navegação inferior
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexAtual,
        onTap: (index) {
          setState(() {
            indexAtual = index;
            controladorPagina.jumpToPage(index);
          });
        },
        backgroundColor: CustomColors.customSwatchColor.shade800,
        selectedItemColor: CustomColors.customContrastColor,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: CustomColors.customContrastColor.withAlpha(100),

        //Itens do menu de navegação
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Menu Inicial',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Carrinho',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
