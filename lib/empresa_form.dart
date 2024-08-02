import 'package:flutter/material.dart';

class EmpresaFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sobre Nosotros",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 110, 0, 0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipOval(
                child: Image.asset(
                  'assets/lucario.png', // Cambia la imagen si es necesario
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Restaurante Mega Lucario',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nuestra Historia:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Fundado en 2023, Restaurante Mega Lucario ha estado sirviendo a la comunidad con una experiencia gastronómica única. Nuestro compromiso con la calidad y el servicio al cliente ha sido la base de nuestro éxito. Ofrecemos una amplia variedad de platos elaborados con ingredientes frescos y locales.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Nuestros Valores:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '• Compromiso con la calidad\n'
              '• Atención al cliente excepcional\n'
              '• Innovación y creatividad en el menú\n'
              '• Respeto por el medio ambiente\n'
              '• Colaboración con proveedores locales',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Información de Contacto:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Dirección: Calle Principal 123, Santo Domingo Tsachilas\n'
              'Teléfono: (123) 456-7890\n'
              'Correo Electrónico: info@mega-lucario.com\n'
              'Horario: Lunes a Domingo, 10:00 AM - 10:00 PM',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
