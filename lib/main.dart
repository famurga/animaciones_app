import 'package:animaciones_app/src/pages/navegacion_page.dart';
import 'package:animaciones_app/src/pages/pagina1_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Pagina1Screen(),
    );
  }
}