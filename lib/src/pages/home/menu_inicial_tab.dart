import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:quitanda_app/src/config/custom_colors.dart';
import 'package:quitanda_app/src/pages/home/components/item_tile.dart';
import '../../Config/app_data.dart' as app_data;
import 'components/category_tile.dart';

class MenuInicialTab extends StatefulWidget {
  const MenuInicialTab({Key? key}) : super(key: key);

  @override
  State<MenuInicialTab> createState() => _MenuInicialTabState();
}

class _MenuInicialTabState extends State<MenuInicialTab> {
  String selectedCategory = 'Frutas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            style: const TextStyle(
              fontSize: 30,
            ),
            children: [
              TextSpan(
                text: 'Mercado',
                style: TextStyle(color: CustomColors.customSwatchColor),
              ),
              TextSpan(
                text: 'Lunar',
                style: TextStyle(color: CustomColors.customContrastColor),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              right: 15,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                badgeColor: CustomColors.customContrastColor,
                badgeContent: const Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: CustomColors.customSwatchColor,
                ),
              ),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          //Campo de Pesquisa
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                hintText: 'Pesquise aqui',
                prefixIcon: Icon(
                  Icons.search,
                  color: CustomColors.customContrastColor,
                  size: 21,
                ),
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
          ),

          //Categorias
          Container(
            padding: const EdgeInsets.only(left: 5),
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return CategoryTile(
                  category: app_data.categories[index],
                  isSelected: app_data.categories[index] == selectedCategory,
                  onPressed: () {
                    setState(() {
                      selectedCategory = app_data.categories[index];
                    });
                  },
                );
              },
              separatorBuilder: (_, index) => const SizedBox(width: 10),
              itemCount: app_data.categories.length,
            ),
          ),

          //Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 9 / 10.5,
              ),
              itemCount: app_data.items.length,
              itemBuilder: (_, index) {
                return ItemTile(
                  item: app_data.items[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
