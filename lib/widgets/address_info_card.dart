import 'package:flutter/material.dart';
import 'package:grocery_onlineapp/models/address_model.dart';

class AddressInfoCard extends StatelessWidget {
  @required
  final bool isSelected;
  final String value;
  final AddressModel addressModel;
  final String groupValue;
  final Function(String) onChanged;
  final String addressType;
  final String address;
  final String phoneNumber;

  const AddressInfoCard({
    Key key,
    this.value,
    this.groupValue,
    this.addressModel,
    this.isSelected,
    this.onChanged,
    this.addressType,
    this.phoneNumber,
    this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    // sub-heading style
    TextStyle subHeadingStyle = textTheme.subtitle1.copyWith(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );

    return Card(
      elevation: isSelected ? 5 : 0,
      color: isSelected ? Colors.white : Color(0xffF6F6F6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio<String>(
                value: value,
                groupValue: groupValue,
                onChanged: (value) => onChanged(value),
              ),
              SizedBox(width: 8),
              Text(
                addressType,
                style: subHeadingStyle,
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: InkWell(
                 child: Icon(
                    Icons.edit_outlined,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              address,
              style: textTheme.caption,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              left: 16,
              bottom: 16,
            ),
            child: Text(
              phoneNumber,
              style: textTheme.caption,
            ),
          ),
        ],
      ),
    );
  }
}
