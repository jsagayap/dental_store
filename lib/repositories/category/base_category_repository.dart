 import 'package:dental_store/models/models.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getAllCategories();
 }