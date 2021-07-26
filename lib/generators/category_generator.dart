import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grocery_onlineapp/constants/image_constants.dart';
import 'package:grocery_onlineapp/models/category_model.dart';
import 'package:grocery_onlineapp/screens/cereals_screen.dart';

List<CategoryModel> FOOD_ITEMS_SUBCATEGORY = [
  CategoryModel(
    imageUrl: ImageConstants.FRUITS_LOGO_URL,
    categoryBackgroundColor: Color(0xffFFF5F4),
    categoryName: "Fruits",
  ),
  CategoryModel(
    imageUrl: ImageConstants.BEVERAGES_LOGO_URL,
    categoryBackgroundColor: Color(0x17f14d42),
    categoryName: "Beverages",
  ),
  CategoryModel(
    imageUrl: ImageConstants.MEAT_FISH_LOGO_URL,
    categoryBackgroundColor: Color(0x3062e0da),
    categoryName: "Meat & Fish",
  ),
  CategoryModel(
      imageUrl: ImageConstants.FROZEN_GOODS_LOGO_URL,
      categoryBackgroundColor: Color(0x21ffd85c),
      categoryName: "Frozen Goods"),
  CategoryModel(
    imageUrl: ImageConstants.SNACKS_LOGO_URL,
    categoryBackgroundColor: Color(0xfffff5f4),
    categoryName: "Snacks",
  ),
  CategoryModel(
    imageUrl: ImageConstants.BREAKFAST_LOGO_URL,
    categoryName: "Breakfast",
    categoryBackgroundColor: Color(0x21ffd85c),
    subCategories: BREAKFAST_ITEMS,
  ),
];

List<CategoryModel> BREAKFAST_ITEMS = [
  CategoryModel(
    imageUrl: ImageConstants.LOCAL_BREAKFAST_LOGO_URL,
    categoryBackgroundColor: Color(0xffFFF5F4),
    categoryName: "Local Breakfast",
  ),
  CategoryModel(
    imageUrl: ImageConstants.ENERGY_BOOSTERS_LOGO_URL,
    categoryBackgroundColor: Color(0x17f14d42),
    categoryName: "Energy Boosters",
  ),
  CategoryModel(
    imageUrl: ImageConstants.CEREALS_LOGO_URL,
    categoryBackgroundColor: Color(0x3062e0da),
    categoryName: "Cereals",
    onPressed: () {
      Get.to(() => CerealsScreen());
    },
  ),
  CategoryModel(
    imageUrl: ImageConstants.JAMS_LOGO_URL,
    categoryBackgroundColor: Color(0x21ffd85c),
    categoryName: "Jams & Spreads",
  ),
];

List<CategoryModel> CATEGORIES = [
  CategoryModel(
    imageUrl: ImageConstants.FOOD_LOGO_URL,
    categoryName: "Food",
    categoryBackgroundColor: Color(0xfffff5f4),
    subCategories: FOOD_ITEMS_SUBCATEGORY,
  ),
  CategoryModel(
    imageUrl: ImageConstants.BABY_LOGO_URL,
     categoryBackgroundColor: Color(0x17f14d42),
    categoryName: "Baby Care",
  ),
  CategoryModel(
    imageUrl: ImageConstants.APPLIANCES_LOGO_URL,
    categoryBackgroundColor: Color(0x3062e0da),
    categoryName: "Appliances",
  ),
  CategoryModel(
    imageUrl: ImageConstants.COVID_LOGO_URL,
    categoryBackgroundColor: Color(0x21ffd85c),
    categoryName: "COVID-19",
  ),
  CategoryModel(
    imageUrl: ImageConstants.GYM_LOGO_URL,
    categoryBackgroundColor: Color(0x2980b4fb),
    categoryName: "Gym",
  ),
  CategoryModel(
    imageUrl: ImageConstants.PET_LOGO_URL,
    categoryBackgroundColor: Color(0x3062e0da),
    categoryName: "Pet Care",
  ),
  CategoryModel(
    imageUrl: ImageConstants.GARDENING_LOGO_URL,
    categoryBackgroundColor: Color(0x17f14d42),
    categoryName: "Gardening",
  ),
  CategoryModel(
    imageUrl: ImageConstants.MEDICINE_LOGO_URL,
    categoryBackgroundColor: Color(0x21ffd85c),
    categoryName: "Medicine",
  ),
];
