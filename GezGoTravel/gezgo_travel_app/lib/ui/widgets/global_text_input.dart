import 'package:flutter/material.dart';

class GlobalTextInput extends StatelessWidget {
  const GlobalTextInput({
    super.key,
     this.regex,
     required this.keyboardType,
     required this.hintText,
     required this.validator,
     required this.obscureText,
     this.suffixIcon,
     required this.focusNode,
     required this.controller,
  });

  final RegExp? regex;
  final FocusNode focusNode;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText:obscureText ,
      keyboardType: keyboardType ,
      decoration:  InputDecoration(
        suffixIcon:suffixIcon,
        border: const OutlineInputBorder(),
        hintText:hintText,
        
      ),
    );
  }
}