import 'package:flutter/material.dart';
class MealType{
  MealType({ required this.title , required this.isSelectedMeal});
  String title;
  bool isSelectedMeal;
}



class FoodItemsList{
  FoodItemsList({required this.item, required this.price,required this.quantity,required this.quantity2});
  String item;
  String price;
  int quantity;
  String quantity2;
}