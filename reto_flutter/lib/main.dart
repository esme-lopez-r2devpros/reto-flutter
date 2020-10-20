import 'package:flutter/material.dart';

import 'package:reto_flutter/src/pages/home_page.dart';
import 'package:reto_flutter/src/pages/detalle_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home'        : (BuildContext context) => HomePage(),
        'detalle'    : (BuildContext context) => DetallePage(),
      },
      theme: ThemeData(
    //Se indica que el tema tiene un brillo luminoso/claro
    brightness: Brightness.light,
    primarySwatch: Colors.pink,
  ),
  //Tema Oscuro, se usa cuando se activa el modo oscuro
  darkTheme: ThemeData(
    //Se indica que el tema tiene un brillo oscuro
    brightness: Brightness.dark,
    primarySwatch: Colors.pink,
  ),
    );
  }
}