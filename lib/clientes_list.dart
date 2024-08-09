import 'package:flutter/material.dart';
import 'database_cuarto.dart';

class ClientesListPage extends StatefulWidget {
  @override
  _ClientesListPageState createState() => _ClientesListPageState();
}

class _ClientesListPageState extends State<ClientesListPage> {
  late DatabaseCuarto _databaseCuarto;
  List<Map<String, dynamic>> _clientes = [];

  @override
  void initState() {
    super.initState();
    _databaseCuarto = DatabaseCuarto();
    _fetchClientes();
  }

  void _fetchClientes() async {
    final data = await _databaseCuarto.getAllClients();
    setState(() {
      _clientes = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lista de Clientes'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _clientes.isEmpty
            ? Center(
                child: Text(
                  'No hay clientes registrados',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
            : ListView.builder(
                itemCount: _clientes.length,
                itemBuilder: (context, index) {
                  final cliente = _clientes[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${cliente['nombre']} ${cliente['apellido']}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Text('Correo: ${cliente['correo']}'),
                        Text('Teléfono: ${cliente['telefono']}'),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
