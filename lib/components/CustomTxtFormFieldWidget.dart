import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTxtFormFieldWidget extends StatelessWidget {
  String? hintTxt;
  TextEditingController controller;
  bool? obscureTest;
  TextInputType? keyboardType;

  CustomTxtFormFieldWidget({
    super.key,
    required this.hintTxt,
    required this.controller,
    this.obscureTest = false,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureTest!,
      style: const TextStyle(color: Colors.black),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintTxt,
        hintStyle: const TextStyle(color: Colors.black),
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black54)
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black54)
        ),
      ),

    );
  }
}
