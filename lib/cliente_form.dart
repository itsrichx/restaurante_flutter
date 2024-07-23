import 'package:flutter/material.dart';
import 'database_cuarto.dart';

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _apellidoController = TextEditingController();
  final _nombreController = TextEditingController();
  final _correoController = TextEditingController();
  final _telefonoController = TextEditingController();

  String? _sexo;
  String? _estadocivil;

  //es para configurar el ingreso de los datos a la base de datos
  late DatabaseCuarto _databaseCuarto;
  @override
  void initState() {
    super.initState();
    _databaseCuarto = DatabaseCuarto();
  }

  //agarra ya los datos, y los inserta en la base
  void _addClient() async {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> client = {
        'apellido': _apellidoController.text,
        'nombre': _nombreController.text,
        'correo': _correoController.text,
        'telefono': _telefonoController.text
      };
      await _databaseCuarto.insertClient(client);
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Formulario Clientes",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.amber),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(onPressed: () => {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () => {}, icon: Icon(Icons.more_vert))
          ],
          actionsIconTheme: IconThemeData(color: Colors.amber),
        ),
        body: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: _apellidoController,
                  decoration: InputDecoration(
                      labelText: 'Apellidos Completos',
                      prefixIcon: Icon(Icons.person)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese Apellidos Completos';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _nombreController,
                  decoration: InputDecoration(
                      labelText: 'Nombres Completos',
                      prefixIcon: Icon(Icons.person)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese nombres completos';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _correoController,
                  decoration: InputDecoration(
                      labelText: 'Correo Electrónico',
                      prefixIcon: Icon(Icons.email)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese un correo válido';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _telefonoController,
                  decoration: InputDecoration(
                      labelText: 'Teléfono', prefixIcon: Icon(Icons.phone)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese un teléfono celular válido';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text('Sexo:'),
                ),
                RadioListTile<String>(
                  title: const Text('Masculino'),
                  value: 'Masculino',
                  groupValue: _sexo,
                  onChanged: (String? value) {
                    setState(() {
                      _sexo = value;
                    });
                  },
                  secondary: Icon(Icons.male),
                ),
                RadioListTile<String>(
                  title: const Text('Femenino'),
                  value: 'Femenino',
                  groupValue: _sexo,
                  onChanged: (String? value) {
                    setState(() {
                      _sexo = value;
                    });
                  },
                  secondary: Icon(Icons.female),
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                      labelText: 'Estado Civil',
                      prefixIcon: Icon(Icons.family_restroom)),
                  value: _estadocivil,
                  onChanged: (String? newValue) {
                    setState(() {
                      _estadocivil = newValue;
                    });
                  },
                  items: <String>[
                    'Casado',
                    'Soltero',
                    'Divorciado',
                    'Viudo',
                    'Unión Libre'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Seleccione un estado civil';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.amber),
                    onPressed: _addClient,
                    child: Text('Enviar'))
              ],
            ),
          ),
        ));
  }
}
