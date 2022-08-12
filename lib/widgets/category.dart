import 'package:flutter/material.dart';


class Category  {
  static Category one = Category(
    'NEWS',
  );
  static Category two = Category(
    'ENTERTAINMENT',
  );
  static Category three = Category(
    'POLITICS',
  );

  static Category five = Category(
    'TECHNOLOGY',
  );
  static Category six = Category(
    'EDUCATION',
  );
  static Category seven = Category(
    'SPORTS',
  );

  final String name;
  Category(this.name);

  static final values = [
    Category.one,
    Category.two,
    Category.three,
    // Category.four,
    Category.five,
    Category.six,
    Category.seven,
  ];
}