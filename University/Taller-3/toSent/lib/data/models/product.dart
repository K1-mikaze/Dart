class Product {
  final int? id;
  final String name;
  final String description;
  final double price;
  final int stock;
  final double discount;
  final int condition;
  final String brand;
  final String model;
  final String typeTransaction;
  final String category;
  final String lastEntry;
  final bool active;
  final String image;

  Product({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.discount,
    required this.condition,
    required this.brand,
    required this.model,
    required this.typeTransaction,
    required this.category,
    required this.lastEntry,
    required this.active,
    required this.image,
  });
}
