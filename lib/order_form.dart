import 'package:flutter/material.dart';

class OrderFormPage extends StatefulWidget {
  @override
  _OrderFormPageState createState() => _OrderFormPageState();
}

class _OrderFormPageState extends State<OrderFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _orderNumberController = TextEditingController();
  final _customerNameController = TextEditingController();
  final _productController = TextEditingController();
  final _quantityController = TextEditingController();

  void _submitOrder() {
    if (_formKey.currentState!.validate()) {
      // Procesar la orden
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Formulario de Orden",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.amber),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _orderNumberController,
                decoration: InputDecoration(
                    labelText: 'Número de Orden',
                    prefixIcon: Icon(Icons.confirmation_number)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese el número de orden';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _customerNameController,
                decoration: InputDecoration(
                    labelText: 'Nombre del Cliente',
                    prefixIcon: Icon(Icons.person)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese el nombre del cliente';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _productController,
                decoration: InputDecoration(
                    labelText: 'Producto',
                    prefixIcon: Icon(Icons.shopping_cart)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese el producto';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _quantityController,
                decoration: InputDecoration(
                    labelText: 'Cantidad',
                    prefixIcon: Icon(Icons.format_list_numbered)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese la cantidad';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.amber),
                onPressed: _submitOrder,
                child: Text('Enviar Orden'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
