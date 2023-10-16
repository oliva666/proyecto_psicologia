import 'package:flutter/material.dart';
import 'package:proyecto_psicologia/Views/inicio_view.dart';
import 'package:proyecto_psicologia/Views/test_vocacional_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asesoria psicologica',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const InicioView(),
      // home: const TestVocacionalView(),
    );
  }
}
