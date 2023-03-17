import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
  });

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      name: snap['name'],
      category: snap['category'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
    );
    return product;
  }

  @override
  List<Object?> get props => [
    name,
    category,
    imageUrl,
    price,
  ];
}