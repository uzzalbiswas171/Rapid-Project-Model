import 'package:flutter/material.dart';

class Category {
  final String id;
  final String name;
  final String imageUrl; // For the actual category image
  final IconData? icon; // Optional, for fallback or if no image
  final Color? bgColor; // Optional background color for category item

  Category({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.icon,
    this.bgColor,
  });
}

class FoodItem {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final String description;
  final double rating;

  FoodItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.description = '',
    this.rating = 0.0,
  });
}