
import 'package:flutter/material.dart';

class MyChip extends StatelessWidget {
  final Function onPressed;
  final String label;
  final bool isSelected;

  MyChip({Key key, this.onPressed, this.label, this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white: Colors.black,
          fontWeight: FontWeight.normal,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: isSelected
            ? Theme.of(context).primaryColor
            : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(
            color:
            isSelected ? Theme.of(context).primaryColor : Colors.white,
            width: 0.7,
          ),
        ),
      ),
    );
  }
}