import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final bool isPassword;
  final TextInputType keyboardType;

  CustomTextFormField({
    required this.labelText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: widget.labelText, labelStyle: TextStyle(color: Colors.white)),
      style: TextStyle(color: Colors.black),
      obscureText: widget.isPassword,
      keyboardType: widget.keyboardType,
    );
  }
}