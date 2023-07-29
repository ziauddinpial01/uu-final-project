import 'package:flutter/material.dart';

class TextFormFieldWiget extends StatelessWidget {
  final String hintText;
  // final ValueChanged<String> onChanged;
  final TextEditingController controller;
  // final FormFieldValidator validate;

  const TextFormFieldWiget({
    Key? key,
    required this.hintText,
    // required this.onChanged,
    required this.controller,
    // required this.validate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        // onChanged: onChanged,
        controller: controller,
        // validator: validate,
        decoration: InputDecoration(
          labelText: hintText,
          hintStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                width: 1, style: BorderStyle.solid, color: Colors.blue),
          ),
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
