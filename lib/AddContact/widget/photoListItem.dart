// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../model/photo.dart';

class PhotoListItem extends StatelessWidget {
  const PhotoListItem({Key? key, required this.photo}) : super(key: key);
  final Photo photo;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: SizedBox(
          width: 90,
          height: 70,
          child: ListTile(title: Image.asset(photo.image)),
        ),
      ),
    );
  }
}
