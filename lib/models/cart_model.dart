import 'package:equatable/equatable.dart';
import 'package:dental_store/models/product_model.dart';

// ignore: must_be_immutable
class Cart extends Equatable {
  final List<Product> products;
  const Cart({ this.products = const <Product>[] });

  @override
  List<Object?> get props => [products];

  Map productQuantity(products) {
    // ignore: prefer_collection_literals
    var quantity = Map();

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      }
      else {
        quantity[product] += 1;
      }
    });

    return quantity;
  }

  double get subtotal => products.fold(0, (total, current) => total + current.price);

  double shippingFee(subtotal) {
    if (subtotal >= 1000.0) {
      return 0.0;
    }
    else {
      return 50.0;
    }
  }

  double total(subtotal, shippingFee) {
    return subtotal + shippingFee(subtotal);
  }

  String freeDelivery(subtotal) {
    if (subtotal >= 1000.0) {
      return 'You are eligible for FREE delivery';
    }
    else {
      double remaining = 1000.0 - subtotal;
      return 'Add PHP ${remaining.toStringAsFixed(2)} for FREE delivery';
    }
  }

  String get subtotalString => subtotal.toStringAsFixed(2);
  String get shippingFeeString => shippingFee(subtotal).toStringAsFixed(2);
  String get freeDeliveryString => freeDelivery(subtotal);
  String get totalString => total(subtotal, shippingFee).toStringAsFixed(2);
}