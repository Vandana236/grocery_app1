import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_onlineapp/generators/brands_list_generator.dart';
import 'package:grocery_onlineapp/generators/category_generator.dart';
import 'package:grocery_onlineapp/widgets/chip_imenu.dart';

import 'bottom_button.dart';

class FilterSearchBottomSheet extends StatefulWidget {
  const FilterSearchBottomSheet({Key key}) : super(key: key);

  @override
  _FilterSearchBottomSheetState createState() =>
      _FilterSearchBottomSheetState();
}

class _FilterSearchBottomSheetState extends State<FilterSearchBottomSheet> {
  // TODO: Make a separate controller for filter search bottom sheet
  // variable to hold value of currently selected category
  List<String> _currentSelectedCategories = [];

  // variable to hold value of currently selected brand
  List<String> _currentSelectedBrands = [];

  // updates list of currently selected items
  void _updateList(List<String> list, String item) {
    if (list.contains(item)) {
      list.remove(item);
      return;
    }
    if (list.length < 2) {
      list.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    // text Theme
    TextTheme textTheme = Theme.of(context).textTheme;
    // screen height
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.9,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BottomSheetHeader(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: SortByBox(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "Price Range",
                  style: textTheme.headline6,
                ),
              ),
              PriceRangeSlider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "Categories",
                  style: textTheme.headline6,
                ),
              ),
              ChipMenu(
                listItems: CATEGORIES.map((e) => e.categoryName).toList(),
                selectedItems: _currentSelectedCategories,
                onChanged: (value) {
                  setState(() {
                    _updateList(_currentSelectedCategories, value);
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 32.0,
                  bottom: 16,
                ),
                child: Text(
                  "Brands",
                  style: textTheme.headline6,
                ),
              ),
              ChipMenu(
                listItems: BRANDS_LIST,
                selectedItems: _currentSelectedBrands,
                onChanged: (value) {
                  setState(() {
                    _updateList(_currentSelectedBrands, value);
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: BottomButton(
                  loadingState: false,
                  disabledState: false,
                  child: Text("Apply filter"),
                  onPressed: () => Get.back(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SortByBox extends StatefulWidget {
  SortByBox({Key key}) : super(key: key);

  @override
  _SortByBoxState createState() => _SortByBoxState();
}

class _SortByBoxState extends State<SortByBox> {
  final List<String> sortByItems = ["Popularity", "Date", "Other"];

  // current selected value
  String _currentSelectedValue = "Popularity";

  @override
  Widget build(BuildContext context) {
    // text Theme
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      color: Colors.white,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Sort By",
              style: textTheme.bodyText1.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text(
              _currentSelectedValue,
              style: textTheme.bodyText1.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            PopupMenuButton<String>(
              child: Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
                size: 24,
              ),
              onSelected: (value) {
                setState(() {
                  _currentSelectedValue = value;
                });
              },
              itemBuilder: (context) {
                return sortByItems
                    .map((e) => PopupMenuItem<String>(
                          child: Text(
                            e,
                            style: textTheme.bodyText2,
                          ),
                          value: e,
                        ))
                    .toList();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PriceRangeSlider extends StatefulWidget {
  const PriceRangeSlider({Key key}) : super(key: key);

  @override
  _PriceRangeSliderState createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  // value for range slider
  RangeValues _values = RangeValues(500, 3000);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RangeSlider(
            min: 0,
            max: 5000,
            divisions: 5000,
            labels: RangeLabels(
                "\$ ${_values.start.toInt()}", "\$ ${_values.end.toInt()}"),
            values: _values,
            onChanged: (values) {
              setState(() {
                _values = values;
              });
            },
          ),
        ),
      ],
    );
  }
}

class BottomSheetHeader extends StatelessWidget {
  const BottomSheetHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // text Theme
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => Get.back(),
          child: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        Text(
          "Filter",
          style: textTheme.headline6,
        ),
        GestureDetector(
          child: Text(
            "Reset",
            style: textTheme.bodyText2.copyWith(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
