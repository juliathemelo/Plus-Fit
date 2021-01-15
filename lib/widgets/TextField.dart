import 'package:flutter/material.dart';
import 'package:plusfit/components/constants.dart';
import 'package:plusfit/widgets/TextFormFieldContainer.dart';

class DefaultTextField extends StatelessWidget {
  final Key key;
  final bool obscureText;
  final String text;
  final prefixicon;
  final suffixicon;

  const DefaultTextField(
      {this.key,
      @required this.obscureText,
      @required this.text,
      this.prefixicon,
      this.suffixicon});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: obscureText,
        style: new TextStyle(color: Colors.black, fontSize: 18),
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            fillColor: Colors.blue,
            prefixIcon: Icon(prefixicon),
            suffixIcon: Icon(suffixicon),
            labelText: text,
            labelStyle: TextStyle(color: pgreytextfield)),
      ),
    );
  }
}
