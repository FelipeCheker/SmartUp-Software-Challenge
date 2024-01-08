import 'package:flutter/material.dart';
import 'package:twitterapp/screens/signup.dart';
import 'package:twitterapp/screens/logIn.dart';
import 'package:twitterapp/screens/homeScreen.dart';
import 'package:twitterapp/auth/services/googleAuth.dart';

class welcomeScreen extends StatelessWidget {
  const welcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: SizedBox(
          height: 25,
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                "See what's happening in the world right now.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the account creation screen
                    // Replace 'YourScreen()' with the screen you want to navigate to
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    'Create Account',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      dynamic result =
                          await signInWithGoogle(); // Llama a la función de inicio de sesión con Google y espera la respuesta
                      if (result != null) {
                        // Si el inicio de sesión es exitoso, realiza alguna acción, por ejemplo, navegar a otra pantalla
                        // Puedes reemplazar 'YourNextScreen()' con la pantalla a la que deseas navegar después del inicio de sesión exitoso
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const homeScreen()),
                        );
                      } else {
                        // Maneja el caso en el que el inicio de sesión no es exitoso
                        // Puede mostrar un mensaje de error, redirigir a una pantalla de error, etc.
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Sign in with Google',
                    ),
                  )),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Have an account already?',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => logInScreen()));
                      // Navigate to the login screen
                      // Add navigation logic here
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}