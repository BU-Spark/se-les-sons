import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// To build the letters in the carousel slider

class CarouselLetter extends StatelessWidget {
  String letter;

  CarouselLetter(this.letter);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: const Color(0xff006cff),
      child: SizedBox(
        child: Center(
          child: Text(
            letter,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Helvetica',
                fontWeight: FontWeight.w700,
                fontSize: 80),
          ),
        ),
      ),
    );
  }
}
