import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rekhdekh/screens/splashscreen.dart';

import 'screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyABjw8br_EPCfVM7BpYf2FmwQhBpFgCdK4",
            authDomain: "doctor-app-8ecc3.firebaseapp.com",
            projectId: "doctor-app-8ecc3",
            storageBucket: "doctor-app-8ecc3.appspot.com",
            messagingSenderId: "493048497325",
            appId: "1:493048497325:web:e4e4db016a639e6cd5b224"));
  } else {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyABjw8br_EPCfVM7BpYf2FmwQhBpFgCdK4",
            authDomain: "doctor-app-8ecc3.firebaseapp.com",
            projectId: "doctor-app-8ecc3",
            storageBucket: "doctor-app-8ecc3.appspot.com",
            messagingSenderId: "493048497325",
            appId: "1:493048497325:web:e4e4db016a639e6cd5b224"));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home:  SplashScreen(),
    );
  }
}

