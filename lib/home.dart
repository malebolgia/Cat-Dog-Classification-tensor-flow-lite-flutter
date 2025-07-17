import 'dart:io';

import 'package:image/image.dart' as img;

import 'package:cat_dog_classification/classifier.dart';
import 'package:cat_dog_classification/classifier_float.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Classifier _classifier;
  bool _loading = true;
  File? _image;

  final picker = ImagePicker();
  Image? _imageWidget;

  Category? category;

  @override
  void initState() {
    super.initState();
    _classifier = ClassifierFloat();
  }

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile!.path);
      _imageWidget = Image.file(_image!);

      _predict();
    });
  }

  void _predict() async {
    img.Image imageInput = img.decodeImage(_image!.readAsBytesSync())!;
    var pred = _classifier.predict(imageInput);

    setState(() {
      this.category = pred;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 50),
                Text(
                  'AJOV Testing',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Cats and Dogs Class App ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: _image == null
                      ? Text('No image selected.')
                      : Container(
                          constraints: BoxConstraints(
                              maxHeight:
                                  MediaQuery.of(context).size.height / 2),
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          child: _imageWidget,
                        ),
                ),
                SizedBox(
                  height: 36,
                ),
                Text(
                  category != null ? category!.label : '',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  category != null
                      ? 'Confidence: ${category!.score.toStringAsFixed(3)}'
                      : '',
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width - 250,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 18),
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              'Capture a Photo',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                            onTap: () {
                              getImage();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width - 250,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 18),
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'Select a photo',
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ],
                    ))
              ],
            )));
  }
}
