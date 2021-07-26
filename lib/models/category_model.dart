import 'package:flutter/material.dart';

class CategoryModel {
  String imageUrl;
  String categoryName;
  Function onPressed;
  Color categoryBackgroundColor;
  List<CategoryModel> subCategories;

  CategoryModel({
    this.imageUrl,
    this.categoryBackgroundColor,
    this.categoryName,
    this.subCategories,
    this.onPressed,
  });
}
