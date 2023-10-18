import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:picsum_photos_app/configs/string.dart';
import 'package:picsum_photos_app/product/acount.dart';
import 'package:picsum_photos_app/product/item_picture.dart';
import 'package:picsum_photos_app/search/search.dart';

class PicturePhoto extends StatefulWidget {
  const PicturePhoto({super.key});

  @override
  // ignore: library_private_types_in_public_api
  PicturePhotoState createState() => PicturePhotoState();
}

class PicturePhotoState extends State<PicturePhoto> {
  List<dynamic> images = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchImages();
    });
  }

  _fetchImages() async {
    final response =
        await http.get(Uri.parse('https://yvl68q-3000.csb.app/dataPicsums'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      setState(() {
        images = data;
      });
    } else {
      // ignore: avoid_print
      print('Failed to load images');
    }
  }

  @override
  Widget build(BuildContext context) {
   

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double containerWidth = screenWidth * 1; // 60% của chiều rộng màn hình
    double containerHeight = screenHeight * 1; // 40% của chiều cao màn hình
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Thiết lập này sẽ loại bỏ nút back
        title: const Text(
          Tiltes.title_home,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchPicture(
                              images: images,
                            )));
              },
              icon: const Icon(
                Icons.search,
                size: 30,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Acount()));
              },
              icon: const Icon(
                Icons.account_circle,
                size: 30,
              )),
        ],
      ),
      body: Container(
        color: const Color.fromARGB(255, 222, 222, 222),
        child: GridView.count(
          padding: const EdgeInsets.all(8),
          crossAxisCount: 2, // Số lượng cột. Bạn có thể thay đổi giá trị này.
          mainAxisSpacing: 0, // Thiết lập khoảng cách trục chính thành 0
          crossAxisSpacing: 0, // Thiết lập khoảng cách trục phụ thành 0

          children: List.generate(
            images.length,
            (index) {
              return GestureDetector(
                // Sử dụng GestureDetector thay vì ListTile
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    Container(
                        color: Colors.white,
                        margin: const EdgeInsets.all(4),
                        width: containerWidth,
                        height: containerHeight,
                        child: Image.network(
                          "https://yvl68q-3000.csb.app/${images[index]['avatarFile']}",
                          fit: BoxFit.cover,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        )),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        images[index]['author'],
                        style: TextStyle(
                          backgroundColor: Colors.black.withOpacity(
                              0.5), // Để tăng độ tương phản giữa chữ và ảnh
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageDetailScreen(
                        imageUrl:
                            // ignore: unnecessary_brace_in_string_interps
                            "https://yvl68q-3000.csb.app/${images[index]['avatarFile']}",
                            
                        // ignore: unnecessary_brace_in_string_interps
                        author: images[index]['productName'],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

abstract class TranferData {
  List<dynamic>? getData() {
    return null;
  }
}
