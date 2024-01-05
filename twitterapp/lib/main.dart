import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:twitterapp/auth/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyB_jyCAtI3THh0KBrYLLcBnURIlc6OspVE',
        appId: '1:826780712534:android:03d2d328e6858947aac5f7',
        messagingSenderId: '826780712534',
        projectId: 'twitterapp-e927f'),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            //return Text('data');
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'Flutter twitter',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
                useMaterial3: true,
              ),
              home: welcomeScreen(),
            );
            ;
          }

          return Text('Loading');
        });
  }
}
