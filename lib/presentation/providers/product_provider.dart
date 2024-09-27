import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';

class ProductProvider with ChangeNotifier {
  final ProductRepository productRepository;

  List<Product> _products = [];
  bool _isSortedAsc = true;

  List<Product> get products =>
      _isSortedAsc ? _products : _products.reversed.toList();

  ProductProvider(this.productRepository);

  Future<void> fetchProducts() async {
    _products = await productRepository.getProducts();
    notifyListeners();
  }

  void toggleSortOrder() {
    _isSortedAsc = !_isSortedAsc;
    notifyListeners();
  }
}
