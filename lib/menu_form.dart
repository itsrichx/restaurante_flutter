import 'package:flutter/material.dart';
import 'login.dart';
import 'location_form.dart';
import 'empresa_form.dart';
import 'productos_form.dart';

class MenuFormPage extends StatefulWidget {
  @override
  _MenuFormPageState createState() => _MenuFormPageState();
}

class _MenuFormPageState extends State<MenuFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Restaurante Mega Lucario",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 110, 0, 0),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 167, 6, 6),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/login.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Menú',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.black),
              title: Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info, color: Colors.black),
              title: Text('Nosotros'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmpresaFormPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.production_quantity_limits, color: Colors.black),
              title: Text('Productos'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductosFormPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.login, color: Colors.black),
              title: Text('Iniciar Sesión'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => LoginForm())
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.black),
              title: Text('Ubicación'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapSample()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipOval(
                child: Image.asset(
                  'assets/lucario.png',
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Bienvenido a Restaurante Mega Lucario',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Sobre nosotros:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Restaurante Mega Lucario ofrece una experiencia gastronómica única con una variedad de platos exquisitos y un servicio de primera clase. Disfruta de nuestra deliciosa comida en un ambiente acogedor.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Nuestros Servicios:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '• Servicio de atención al cliente excepcional\n'
              '• Platos elaborados con ingredientes frescos\n'
              '• Menú variado y opciones vegetarianas\n'
              '• Reservas para eventos especiales\n'
              '• Encuestas de satisfacción para mejorar continuamente',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.amber),
                onPressed: () {
                  // Acción del botón
                },
                child: Text('Explorar Menú'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginForm(),
    routes: {
    },
  ));
}
