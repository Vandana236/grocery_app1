import 'package:flutter/material.dart';
import 'package:grocery_onlineapp/theme/style.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class MyPinInputTextField extends StatelessWidget {
  final Function(String) onChanged;

  MyPinInputTextField({Key key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Text Theme
    final TextTheme textTheme = Theme.of(context).textTheme;
    return PinInputTextField(
      pinLength: 4,
      decoration: UnderlineDecoration(
        textStyle: textFieldInputStyle(context, FontWeight.bold),
        bgColorBuilder: PinListenColorBuilder(
         Theme.of(context).scaffoldBackgroundColor,
         Theme.of(context).scaffoldBackgroundColor
        ),
        colorBuilder: PinListenColorBuilder(
            Colors.black,
            Colors.black
        ),
      ),
      textInputAction: TextInputAction.go,
      enabled: true,
      autoFocus: true,
      keyboardType: TextInputType.number,
      onChanged: (pin) => onChanged(pin),
      cursor: Cursor(
          enabled: true,
          color: Colors.black,
          width: 1.0
      ),
      enableInteractiveSelection: true,
    );
  }
}