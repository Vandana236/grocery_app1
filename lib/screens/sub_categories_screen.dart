import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_onlineapp/models/category_model.dart';
import 'package:grocery_onlineapp/widgets/select_category_card.dart';

class SubCategoriesScreen extends StatefulWidget {
  @required
  final String screenHeading;
  @required
  final List<CategoryModel> subCategories;

  const SubCategoriesScreen({
    Key key,
    this.screenHeading,
    this.subCategories,
  }) : super(key: key);

  @override
  _SubCategoriesScreenState createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.screenHeading,
          style: textTheme.headline6,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: widget.subCategories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 24.0,
            crossAxisSpacing: 16.0,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) => SelectCategoryCard(
            categoryModel: widget.subCategories[index],
            isSelected: _selectedIndex == index,
            borderRadius: 0,
            onPressed: () {
              if (widget.subCategories[index].subCategories != null &&
                  widget.subCategories[index].subCategories.isNotEmpty) {
                Get.to(() => SubCategoriesScreen(
                  screenHeading: widget.subCategories[index].categoryName,
                  subCategories: widget.subCategories[index].subCategories,
                ));
              }
              else if(widget.subCategories[index].onPressed != null){
                widget.subCategories[index].onPressed();
              }
              else {
                setState(() {
                  _selectedIndex = index;
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
