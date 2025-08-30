
import 'package:foo_app/moduls/Categor_moduls.dart';

class Item {
  final int id;
  final String imagePath;
  final String name;
  final String? description;
  final double price;
  final double colliery;
  final double rating;
  final Category category;

  Item({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.price,
     this.description,
    required this.colliery,
    required this.rating,
    required this.category,
  });
}
