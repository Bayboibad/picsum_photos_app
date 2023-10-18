
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchPicture extends StatefulWidget {
  List<dynamic> images = [];

  SearchPicture({super.key, required this.images});

  @override
  State<SearchPicture> createState() => _SearchPictureState();
}

class _SearchPictureState extends State<SearchPicture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
       widget.images[1]['author'],
        style:const TextStyle(color: Colors.white),
      )),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Image.network(widget.images[1]['download_url']),
      ),
    );
  }
}
