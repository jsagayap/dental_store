import 'package:dental_store/models/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}