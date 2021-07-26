import 'package:flutter/material.dart';

class PaymentMethodSelector extends StatefulWidget {
  final Function(String) onChanged;

  PaymentMethodSelector({this.onChanged});

  @override
  _PaymentMethodSelectorState createState() => _PaymentMethodSelectorState();
}

class _PaymentMethodSelectorState extends State<PaymentMethodSelector> {
  String _value = "COD";

  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyRadioButton(
          heading: "Cash on delivery",
          groupValue: _value,
          value: "COD",
          onChanged: (value) {
            setState(() {
              _value = value;
            });
            widget.onChanged(_value);
          },
        ),
        SizedBox(height: 8),
        MyRadioButton(
          heading: "Bkash",
          groupValue: _value,
          value: "Bkash",
          onChanged: (value) {
            setState(() {
              _value = value;
              widget.onChanged(_value);
            });
          },
        ),
        SizedBox(height: 8),
        MyRadioButton(
          heading: "DBBL Rocket",
          groupValue: _value,
          value: "DBBL Rocket",
          onChanged: (value) {
            setState(() {
              _value = value;
            });
            widget.onChanged(_value);
          },
        ),
        SizedBox(height: 8),
        MyRadioButton(
          heading: "Credit or Debil Card",
          groupValue: _value,
          value: "Credit or Debit Card",
          onChanged: (value) {
            print(value);
            setState(() {
              _value = value;
            });
            widget.onChanged(_value);
          },
        ),
        SizedBox(height: 8),
      ],
    );
  }
}

class MyRadioButton extends StatelessWidget {
  final Function(String) onChanged;
  final String value;
  final String groupValue;
  final String heading;

  const MyRadioButton({
    Key key,
    this.onChanged,
    this.value,
    this.groupValue,
    this.heading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio<String>(
          value: value,
          groupValue: groupValue,
          onChanged: (value) {
            onChanged(value);
          }
        ),
        SizedBox(width: 8),
        Text(
          heading,
          style: textTheme.bodyText1,
        )
      ],
    );
  }
}
