import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitterapp/services/firebaseAuth.dart';
import 'package:twitterapp/services/homeScreen.dart';

class getPass extends StatelessWidget {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController;
  final FirebaseAuthService _auth = FirebaseAuthService();

  getPass(this.emailController);

  void signInAction(BuildContext context) async {
    User? user = await _auth.signInWithEmailAndPassword(
        emailController.text, passwordController.text);

    if (user != null) {
      print("User is successfully signed in");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => getPass(emailController)),
      );
    } else {
      print("some error occured");
    }
  }

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
        title: Image.asset(
          'assets/images/logo.png',
          height: 50,
          width: 50,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 40, 50, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40.0),
            const Text(
              'Enter your password',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
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
              onChanged: (val) => passwordController.text = val,
            ),
            const SizedBox(height: 16.0),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              signInAction(context);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blueAccent,
            ),
            child: const Text(
              'Next',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
