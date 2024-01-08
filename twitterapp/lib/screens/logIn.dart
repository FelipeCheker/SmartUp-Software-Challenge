import 'package:flutter/material.dart';
import 'package:twitterapp/auth/logIn2.dart';

class logInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  logInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.blue,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          }, // Color al pasar el mouse
        ),
        centerTitle: true,
        title: SizedBox(
          height: 25,
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 40, 50, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40.0),
            const Text(
              'To get started, first enter your phone, email, or @username',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Phone, email or username ',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
                enabledBorder: UnderlineInputBorder(
                  //<-- SEE HERE
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.white,
                  ),
                ),
              ),
              style: const TextStyle(color: Colors.white),
              onChanged: (val) => emailController.text = val,
            ),
            const SizedBox(height: 16.0),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black, // Color de la barra de navegación inferior
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.end, // Alinea el botón a la derecha
          children: [
            const SizedBox(
                width:
                    16), // Espacio a la derecha para separar el botón del borde
            SizedBox(
              // Define el tamaño del botón
              width: 100, // Ancho del botón
              height: 40, // Alto del botón
              child: ElevatedButton(
                onPressed: () {
                  if (emailController.text.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => getPass(emailController)),
                    );
                  } else {
                    // Mostrar un diálogo, snackbar o mensaje indicando que los campos son obligatorios
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Incomplete Fields'),
                          content: const Text(
                              'Please fill in all the required fields.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
