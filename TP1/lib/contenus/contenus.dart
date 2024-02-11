import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Contenus {
  final int id;
  final String title;
  final String description;
  final String imageUrl;

  Contenus({required this.id, required this.title, required this.description, required this.imageUrl});
}