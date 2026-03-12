import 'package:flutter/material.dart';

class CategoryModel {
  final String name;
  final IconData icon;
  final Color color;
  final Color iconcolor;

  const CategoryModel({
    required this.name,
    required this.iconcolor,
    required this.icon,
    required this.color,
  });
}
