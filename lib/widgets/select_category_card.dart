import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_onlineapp/models/category_model.dart';
import 'package:grocery_onlineapp/utils/string_formatter.dart';

class SelectCategoryCard extends StatelessWidget {
  const SelectCategoryCard({
    Key key,
    @required this.categoryModel,
    @required this.isSelected,
    @required this.onPressed,
    this.borderRadius,
  }) : super(key: key);

  final CategoryModel categoryModel;
  final Function onPressed;
  final bool isSelected;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      decoration: BoxDecoration(
        color:  !isSelected ? Colors.white : Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
            color: !isSelected ? Colors.white : Theme.of(context).primaryColor,
            blurRadius: 5,
            offset: Offset(0, 0.75),
          )
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: !isSelected ? Colors.white : Theme.of(context).primaryColor,
          shadowColor: Theme.of(context).primaryColor,
          elevation: !isSelected ? 0 : 5,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius == null
                ? BorderRadius.circular(5)
                : BorderRadius.circular(5),
          ),
          fixedSize: Size.fromWidth(72),
        ),
        onPressed: () => onPressed(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(),
            StringFormatter.getImageExtension(categoryModel.imageUrl) == "svg"
                ? CircleAvatar(
                    backgroundColor : isSelected ? Colors.white : categoryModel.categoryBackgroundColor,
                    radius: 30,
                    child: SvgPicture.asset(
                      categoryModel.imageUrl,
                      height: 35,
                    ),
                  )
                : CircleAvatar(
                    radius: 30,
                    backgroundColor: isSelected ? Colors.white : categoryModel.categoryBackgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Image.asset(
                        categoryModel.imageUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
            Text(
              categoryModel.categoryName,
              style: TextStyle(
                color: !isSelected ? Colors.black : Colors.white,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
