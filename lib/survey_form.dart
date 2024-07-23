import 'package:flutter/material.dart';

class SurveyFormPage extends StatefulWidget {
  @override
  _SurveyFormPageState createState() => _SurveyFormPageState();
}

class _SurveyFormPageState extends State<SurveyFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _feedbackController = TextEditingController();

  void _submitSurvey() {
    if (_formKey.currentState!.validate()) {
      // Procesar la encuesta
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Formulario de Encuesta",
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
                controller: _nameController,
                decoration: InputDecoration(
                    labelText: 'Nombre',
                    prefixIcon: Icon(Icons.person)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(
                    labelText: 'Edad',
                    prefixIcon: Icon(Icons.calendar_today)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su edad';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _feedbackController,
                decoration: InputDecoration(
                    labelText: 'Comentarios',
                    prefixIcon: Icon(Icons.feedback)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese sus comentarios';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.amber),
                onPressed: _submitSurvey,
                child: Text('Enviar Encuesta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
