import 'package:flutter/material.dart';

import '../../main/main.dart';
import '../colours/styleColor.dart';

TextStyle blackAndWhite = const TextStyle(
    fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25);

heightApp(double height) {
  return SizedBox(
    height: height,
  );
}

snackBarMassage (BuildContext context, String text,Color color){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
        duration: const Duration(seconds: 3),
      ));
}
