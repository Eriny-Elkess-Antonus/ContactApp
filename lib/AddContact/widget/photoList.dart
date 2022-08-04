// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/theme.dart';
import '../model/photoProvider.dart';
import 'photoListItem.dart';

class PhotoList extends StatefulWidget {
  const PhotoList({Key? key}) : super(key: key);

  @override
  State<PhotoList> createState() => _PhotoListState();
}

class _PhotoListState extends State<PhotoList> {
  @override
  Widget build(BuildContext context) {
    final photos = context.read<PhotoProvider>();
    final photo = photos.photos;
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) =>
            const Padding(padding: AppDimens.pagePadding),
        itemCount: photo.length,
        itemBuilder: (context, index) {
          return PhotoListItem(
            photo: photo[index],
          );
        },
      ),
    );
  }
}
