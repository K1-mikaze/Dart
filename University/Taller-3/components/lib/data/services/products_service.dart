import 'package:components/data/models/product.dart';

class ProductsService {
  List<Product> products = [];

  ProductsService();

  void addProduct({
    int? id,
    required String name,
    required String description,
    required double price,
    required int stock,
    required double discount,
    required int condition,
    required String brand,
    required String model,
    required String typeTransaction,
    required String category,
    required String lastEntry,
    required bool active,
    required String image,
  }) {
    products.add(
      Product(
        id: id,
        name: name,
        description: description,
        price: price,
        stock: stock,
        discount: discount,
        condition: condition,
        brand: brand,
        model: model,
        typeTransaction: typeTransaction,
        category: category,
        lastEntry: lastEntry,
        active: active,
        image: image,
      ),
    );
  }

  List<Product> getProducts() {
    return products;
  }
}
