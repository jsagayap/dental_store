import 'package:dental_store/models/models.dart';
import 'package:equatable/equatable.dart';

class Checkout extends Equatable {
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;

  const Checkout({
    required this.address,
    required this.city,
    required this.country,
    required this.zipCode,
    required this.products,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
  });

  @override
  List<Object?> get props => [
    address,
    city,
    country,
    zipCode,
    products,
    subtotal,
    deliveryFee,
    total,
  ];

  Map<String, Object> toDocument() {
    // ignore: prefer_collection_literals
    Map customerAddress = Map();
    customerAddress['address'] = address;
    customerAddress['city'] = city;
    customerAddress['country'] = country;
    customerAddress['zipCode'] = zipCode;

    return {
      'customerAddress': customerAddress,
      'products': products!.map((product) => product.name).toList(),
      'subtotal': subtotal!,
      'deliveryFee': deliveryFee!,
      'total': total!
    };
  }
}