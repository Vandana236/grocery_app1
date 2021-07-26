import 'package:grocery_onlineapp/generators/category_generator.dart';
import 'package:grocery_onlineapp/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:grocery_onlineapp/widgets/select_category_card.dart';

class SelectCategories extends StatefulWidget {
  final Function(int) onSelected;

  const SelectCategories({Key key, this.onSelected}) : super(key: key);

  @override
  _SelectCategoriesState createState() => _SelectCategoriesState();
}

class _SelectCategoriesState extends State<SelectCategories> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: CATEGORIES.length,
          itemBuilder: (context, index) {
            CategoryModel categoryModel = CATEGORIES[index];
           if(index == 0){
             return Row(
               children: [
                 SizedBox(width: 16),
                 SelectCategoryCard(
                   categoryModel: categoryModel,
                   onPressed: () {
                     widget.onSelected(index);
                     setState(() {
                       _selectedIndex = index;
                     });
                   },
                   isSelected: _selectedIndex == index,
                 ),
                 SizedBox(width: 16),
               ],
             );
            }
            return Row(
              children: [
                SelectCategoryCard(
                  categoryModel: categoryModel,
                  onPressed: () {
                    widget.onSelected(index);
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  isSelected: _selectedIndex == index,
                ),
                SizedBox(width: 16),
              ],
            );
          }),
    );
  }
}
