import 'package:flutter/material.dart';
import 'package:myapp/Homepage.dart';

void main() {
  runApp(MaterialApp(
    title: 'Les Sons',
    home: Homepage(),
    theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.grey,
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.white,
        )),
  ));
}
