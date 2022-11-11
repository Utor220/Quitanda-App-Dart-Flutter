import 'package:flutter/material.dart';
import 'package:quitanda_app/src/Config/custom_colors.dart';

class AppNameWidget extends StatelessWidget {
  final Color? mercadoTitleColor;
  final double textSize;
  const AppNameWidget({
    Key? key,
    this.mercadoTitleColor,
    this.textSize = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontSize: textSize,
        ),
        children: [
          TextSpan(
            text: 'Mercado',
            style: TextStyle(
                color: mercadoTitleColor ?? CustomColors.customSwatchColor),
          ),
          TextSpan(
            text: 'Lunar',
            style: TextStyle(color: CustomColors.customContrastColor),
          ),
        ],
      ),
    );
  }
}
