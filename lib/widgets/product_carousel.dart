import 'package:flutter/material.dart';
import 'package:dental_store/models/product_model.dart';
import 'product_card.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;

  const ProductCarousel({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 250,
        child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 20.0, top: 12.0, bottom: 25.0),
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ProductCard(product: products[index]),
            );
          }
        ),
      ),
    );
  }
}