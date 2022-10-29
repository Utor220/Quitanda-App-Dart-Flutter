import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldFormStyle extends StatefulWidget {
  final IconData tfIcone;
  final String tfLabel;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatters;

  const TextFieldFormStyle({
    Key? key,
    required this.tfIcone,
    required this.tfLabel,
    this.isSecret = false,
    this.inputFormatters,
  }) : super(key: key);

  @override
  State<TextFieldFormStyle> createState() => _TextFieldFormStyleState();
}

class _TextFieldFormStyleState extends State<TextFieldFormStyle> {
  bool isObscure = false;
  @override
  void initState() {
    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        inputFormatters: widget.inputFormatters,
        obscureText: isObscure,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.tfIcone),
          suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon:
                      Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                )
              : null,
          labelText: widget.tfLabel,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
