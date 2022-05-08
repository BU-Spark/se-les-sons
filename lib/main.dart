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

//TODO: Throughout the files you will see a lot of hardcoded strings used. Move these strings into the assests folder so that way they can be access via that way and allows for translation in other languages. Furthermore, allows reuse of the same strings.
//TODO: There are instances when multiple of the same object is created, so to minimize code, find a way to loop component creation to minimize code. You will see such instance in Homepage, or lessons_1 for instance.