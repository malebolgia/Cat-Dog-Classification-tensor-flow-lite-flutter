import 'package:cat_dog_classification/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat and Dog Classifier',
      home: MySplash(),
      debugShowCheckedModeBanner: false,
    );
  }
}

