import 'package:grocery_onlineapp/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  // Hint text for text field
  final String hintText;

  // Callback functions
  final Function(String) onChanged;
  final Function(String) onSaved;

  // Other properties
  final TextInputType keyboardType;
  final double height;
  final String prefixText;
  final TextEditingController controller;
  final Icon prefixIcon;
  final FontWeight inputTextFontWeight;
  final Icon suffixIcon;
  final Function onTap;
  final String initialText;
  final bool readOnly;
  final int maxLines;
  final int maxlength;
  final TextCapitalization textCapitalization;
  final bool autofocus;
  final List<TextInputFormatter> inputFormatters;
  final bool obscureText;

  // Constructor of text field
  const MyTextField({
    this.onSaved,
    this.inputTextFontWeight,
    this.onTap,
    this.prefixText,
    this.prefixIcon,
    this.textCapitalization,
    this.maxLines,
    this.controller,
    this.height,
    this.readOnly,
    this.suffixIcon,
    this.initialText,
    this.inputFormatters,
    this.onChanged,
    this.hintText,
    this.keyboardType,
    this.autofocus,
    this.obscureText,
    this.maxlength,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      controller: controller,
      style: textFieldInputStyle(context, inputTextFontWeight),
      keyboardType: keyboardType ?? TextInputType.text,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      obscureText: obscureText ?? false,
      autofocus: autofocus ?? false,
      readOnly: readOnly ?? false,
      maxLines: maxLines ?? 1,
      initialValue: initialText,
      maxLength: maxlength,
      onTap: onTap,
      inputFormatters: inputFormatters ?? [],
      decoration: InputDecoration(
        prefixText: prefixText,
        prefixStyle: textFieldInputStyle(context, inputTextFontWeight),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2.0,
            color: Colors.black,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 0.7,
            color: Colors.black,
          ),
        ),
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintStyle: textFieldHintStyle(context),
      ),
      onChanged: (value) => onChanged(value),
      onSaved: (value) => onSaved(value),
    );
  }
}
