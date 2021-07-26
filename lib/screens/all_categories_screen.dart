import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_onlineapp/generators/category_generator.dart';
import 'package:grocery_onlineapp/screens/sub_categories_screen.dart';
import 'package:grocery_onlineapp/widgets/select_category_card.dart';

class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({Key key}) : super(key: key);

  @override
  _AllCategoriesScreenState createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Categories",
          style: textTheme.headline6,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: CATEGORIES.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 12.0,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) => SelectCategoryCard(
            categoryModel: CATEGORIES[index],
            isSelected: _selectedIndex == index,
            borderRadius: 0,
            onPressed: () {
              if (CATEGORIES[index].subCategories != null &&
                  CATEGORIES[index].subCategories.isNotEmpty) {
                Get.to(SubCategoriesScreen(
                  screenHeading: CATEGORIES[index].categoryName,
                  subCategories: CATEGORIES[index].subCategories,
                ));
              } else {
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
