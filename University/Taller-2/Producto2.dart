class Producto2{
  String categoria;
  String descripcion;
  double precio;
  int existencia;

  Producto2({
    required this.categoria,
    required this.descripcion,
    required this.precio,
    required this.existencia,
  });
}

Map<String, double> CalculateByCategory(List<Producto2> inventory) {
  Map<String, double> totalPorCategoria = {};

  for (var product in inventory) {
    double valorTotal = product.precio * product.existencia;
    if (totalPorCategoria.containsKey(product.categoria)) {
      totalPorCategoria[product.categoria] = totalPorCategoria[product.categoria]! + valorTotal;
    } else {
      totalPorCategoria[product.categoria] = valorTotal;
    }
  }
  return totalPorCategoria;
}
