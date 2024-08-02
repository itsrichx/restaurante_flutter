import 'package:flutter/material.dart';
import 'cliente_form.dart';
import 'order_form.dart';
import 'survey_form.dart';
import 'menu_form.dart';

class Menu2FormPage extends StatefulWidget {
  @override
  _Menu2FormPageState createState() => _Menu2FormPageState();
}

class _Menu2FormPageState extends State<Menu2FormPage> {
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
              leading: Icon(Icons.person, color: Colors.black),
              title: Text('Clientes'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.work, color: Colors.black),
              title: Text('Orden de pedido'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderFormPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.book, color: Colors.black),
              title: Text('Encuestas'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SurveyFormPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.login, color: Colors.black),
              title: Text('Cerrar Sesión'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => MenuFormPage())
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