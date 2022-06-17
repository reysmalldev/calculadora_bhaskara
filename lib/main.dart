import 'package:calculadora_bhaskara/ui/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.amber,
      ),
    ),
    home: HomePage(),
  ));
}
