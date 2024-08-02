import 'package:flutter/material.dart';

class ProductosFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Productos",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 110, 0, 0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ProductCard(
              imageUrl: 'assets/product1.png',
              name: 'Pizza Margherita',
              description: 'Pizza con salsa de tomate, mozzarella y albahaca.',
              price: '\$12.99',
            ),
            ProductCard(
              imageUrl: 'assets/product2.png',
              name: 'Pasta Carbonara',
              description: 'Pasta con salsa carbonara, panceta y queso parmesano.',
              price: '\$14.99',
            ),
            ProductCard(
              imageUrl: 'assets/product3.png',
              name: 'Ensalada César',
              description: 'Ensalada con lechuga, pollo, queso parmesano y aderezo César.',
              price: '\$11.99',
            ),
            // Agrega más ProductCard aquí si es necesario
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final String price;

  ProductCard({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        leading: Image.asset(
          imageUrl,
          width: 100,
          fit: BoxFit.cover,
        ),
        title: Text(
          name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 8.0),
            Text(
              price,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
