import 'package:flutter/material.dart';
import 'my_chip.dart';

class ChipMenu extends StatelessWidget {
  @required
  final List<String> listItems;
  final List<String> selectedItems;
  @required
  final Function(String) onChanged;

  ChipMenu({this.listItems, this.onChanged, this.selectedItems});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4.0, // gap between adjacent chips
      runSpacing: 4.0, // gap between lines
      children: <Widget>[
        ..._generatePreferences(
          onPressed: onChanged,
          selectedItems: selectedItems ?? [],
        )
      ],
    );
  }

  _generatePreferences(
      {Function(String) onPressed, List<String> selectedItems}) {
    return listItems
        .map((preference) => GetChip(
              preference: preference,
              onPressed: onPressed,
              isSelected: selectedItems.contains(preference),
            ))
        .toList();
  }
}

class GetChip extends StatelessWidget {
  final String preference;
  final bool isSelected;
  final Function(String) onPressed;

  GetChip({
    this.preference,
    this.onPressed,
    this.isSelected,
  });

  Widget build(BuildContext context) {
    return MyChip(
      label: preference,
      isSelected: isSelected,
      onPressed: () => onPressed(preference),
    );
  }
}
