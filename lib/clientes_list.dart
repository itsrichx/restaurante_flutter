import 'package:flutter/material.dart';
import 'database_cuarto.dart';

class ClientesListPage extends StatefulWidget {
  @override
  _ClientesListPageState createState() => _ClientesListPageState();
}

class _ClientesListPageState extends State<ClientesListPage> {
  late DatabaseCuarto _databaseCuarto;
  late Future<List<Map<String, dynamic>>> _clientesList;

  @override
  void initState() {
    super.initState();
    _databaseCuarto = DatabaseCuarto();
    _loadClients();
  }

  void _loadClients() {
    setState(() {
      _clientesList = _databaseCuarto.getAllClients();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lista de Clientes"),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.amber),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _clientesList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al cargar los clientes'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay clientes registrados'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final client = snapshot.data![index];
                return ListTile(
                  title: Text('${client['nombre']} ${client['apellido']}'),
                  subtitle: Text('Correo: ${client['correo']}\nTeléfono: ${client['telefono']}'),
                  isThreeLine: true,
                );
              },
            );
          }
        },
      ),
    );
  }
}
