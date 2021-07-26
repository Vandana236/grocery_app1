import 'package:grocery_onlineapp/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextBox extends StatelessWidget {
  // Hint text for text field
  final String hintText;

  // Callback functions
  final Function(String) onChanged;
  final Function onEditingComplete;
  final Function(String) onSaved;

  // Other properties
  final TextInputType keyboardType;
  final double height;
  final TextEditingController controller;
  final Icon prefixIcon;
  final Icon suffixIcon;
  final Function onTap;
  final String initialText;
  final bool readOnly;
  final int maxLines;
  final TextCapitalization textCapitalization;
  final bool autofocus;
  final List<TextInputFormatter> inputFormatters;
  final bool obscureText;

  // Constructor of text field
  const MyTextBox({
    this.onSaved,
    this.onTap,
    this.prefixIcon,
    this.textCapitalization,
    this.maxLines,
    this.onEditingComplete,
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
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        cursorColor: Colors.grey[800],
        controller: controller,
        style: textFieldHintStyle(context),
        keyboardType: keyboardType ?? TextInputType.text,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        obscureText: obscureText ?? false,
        autofocus: autofocus ?? false,
        readOnly: readOnly ?? false,
        maxLines: maxLines ?? 1,
        initialValue: initialText,
        onTap: onTap,
        inputFormatters: inputFormatters ?? [],
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).accentColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
                width: 0,
                color: Theme.of(context).accentColor,
                style: BorderStyle.none),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
                width: 0,
                color: Theme.of(context).accentColor,
                style: BorderStyle.none),
          ),
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,

          hintStyle: textFieldHintStyle(context),
          contentPadding: EdgeInsets.only(bottom: 12.0),
        ),
        onChanged: (value) => onChanged(value),
        onSaved: (value) => onSaved(value),
        onEditingComplete:  () => onEditingComplete(),
      ),
    );
  }
}
