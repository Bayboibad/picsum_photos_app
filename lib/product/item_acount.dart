import 'package:flutter/material.dart';
import 'package:picsum_photos_app/configs/colors.dart';
import 'package:picsum_photos_app/configs/string.dart';

class ItemAcount extends StatefulWidget {
  final String imagesUrl;
  const ItemAcount({super.key, required this.imagesUrl});

  @override
  State<ItemAcount> createState() => _ItemAcountState();
}

class _ItemAcountState extends State<ItemAcount> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double containerWidth = screenWidth * 1;
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        Tiltes.Profile,
        style: TextStyle(color: Colors.white, fontSize: 20),
      )),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(4),
          child: Column(
            children: [
              Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 140,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.greenBackgroud,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit_square,
                          size: 25,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          Tiltes.Edit,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 16,
              ),
              Container(
                margin: const EdgeInsets.all(8),
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image:
                        DecorationImage(image: NetworkImage(widget.imagesUrl))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
