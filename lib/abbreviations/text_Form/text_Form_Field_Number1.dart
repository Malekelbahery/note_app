import 'package:flutter/material.dart';
import 'package:note_app/abbreviations/colours/styleColor.dart';

class TextFormField1 extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final String? Function(String?)? validator;
  final TextInputType type;
  final bool obscureText;
  final Icon icon;

  const TextFormField1(
      {super.key,
      required this.controller,
      required this.text,
      required this.validator,
      required this.type,
      this.obscureText = false,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        style: TextStyle(color: white),
        cursorColor: white,
        textAlign: TextAlign.justify,
        maxLines: 1,
        validator: validator,
        obscureText: obscureText,
        keyboardType: type,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: icon,
          prefixIconColor: darkGrey,
          fillColor: black,
          hintText: text,
          hintStyle: TextStyle(color: darkGrey),
          filled: true,
          errorStyle: const TextStyle(fontSize: 0),
          enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: black, width: 0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: black, width: 0)),
          errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: red, width: 1)),
        ),
      ),
    );
  }
}
