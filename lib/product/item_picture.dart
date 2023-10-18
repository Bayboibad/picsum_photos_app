import 'package:flutter/material.dart';

class ImageDetailScreen extends StatelessWidget {
  final String imageUrl;
  final String author;

  const ImageDetailScreen({super.key, required this.imageUrl, required this.author});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(author, style:const TextStyle(color: Colors.white),)),
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}
