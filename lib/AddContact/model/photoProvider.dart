// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'photo.dart';

class PhotoProvider extends ChangeNotifier {
  final List<Photo> _photos = [
    Photo(image: 'assets/man.png'),
    Photo(image: 'assets/person.jpg'),
    Photo(image: 'assets/woman.png'),
  ];

  List<Photo> get photos {
    return [..._photos];
  }
}
