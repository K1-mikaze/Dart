import 'package:flutter/material.dart';
import '../../data/service/Products_Service.dart';

class CardBuilderScreen extends StatelessWidget {
  const CardBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductService market = ProductService();
    var products = market.getProducts();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Listado de tarjetas'),
        shadowColor: Colors.blue,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, i) {
          final product = products[i];
          return Card(
            elevation: 8,
            shadowColor: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          product.imageURL,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              product.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 14),
                            Text(
                              "${product.price.toString()} COP",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 14),
                            Text(
                              product.existence.toString() +
                                  (product.existence == 1
                                      ? " Unidad disponible"
                                      : " Unidades disponibles"),
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    product.description,
                    maxLines: 10,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
