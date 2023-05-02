// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProductModel {
  bool isFavorite;
  String title;
  double price;
  String description;
  ProductModel({
    required this.isFavorite,
    required this.title,
    required this.price,
    required this.description,
  });
}
