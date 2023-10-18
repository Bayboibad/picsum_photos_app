import 'package:flutter/material.dart';
import 'package:picsum_photos_app/configs/colors.dart';
import 'package:picsum_photos_app/configs/string.dart';
import 'package:picsum_photos_app/login/login.dart';
import 'package:picsum_photos_app/product/item_acount.dart';

class Acount extends StatelessWidget {
  const Acount({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double containerWidth = screenWidth * 1;
     String imagesUrl =  "https://scontent.fhan5-9.fna.fbcdn.net/v/t39.30808-6/387829446_1693550581124014_1107626128942200262_n.jpg?stp=cp6_dst-jpg&_nc_cat=109&ccb=1-7&_nc_sid=5f2048&_nc_ohc=JSa3zkGVQukAX868JSO&_nc_ht=scontent.fhan5-9.fna&_nc_e2o=f&oh=00_AfC1UGuaKEhNjVSRRvGVCsNdhZdBOXuVYXEJUJz7XSycqA&oe=6530914F";

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Tiltes.Acount,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(4),
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image:  DecorationImage(
                  image: NetworkImage(imagesUrl),
                                       fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomGestureItem(
              leadingIcon: Icons.account_circle,
              text: Tiltes.Profile,
              trailingIcon: Icons.arrow_right,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ItemAcount(imagesUrl: imagesUrl.toString(),)),
                );
              },
            ),
            const CustomDivider(),
            CustomGestureItem(
              leadingIcon: Icons.settings,
              text: Tiltes.Setting,
              trailingIcon: Icons.arrow_right,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Acount()),
                );
              },
            ),
            const CustomDivider(),
            const SizedBox(
              height: 250,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(containerWidth, 50),
                    backgroundColor: AppColors.greenApp),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                child: const Text(
                  Tiltes.Out,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ))
          ]),
        ),
      ),
    );
  }
}

class CustomGestureItem extends StatelessWidget {
  final IconData leadingIcon;
  final String text;
  final IconData trailingIcon;
  final VoidCallback onTap;

  const CustomGestureItem({
    Key? key,
    required this.leadingIcon,
    required this.text,
    required this.trailingIcon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      // ignore: sized_box_for_whitespace
      child: Container(
        width: containerWidth,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 2, child: Icon(leadingIcon, size: 30)),
            Expanded(
              flex: 7,
              child: Text(
                text,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(flex: 2, child: Icon(trailingIcon, size: 30)),
          ],
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.grey,
      height: 10,
      thickness: 1,
      indent: 10,
      endIndent: 10,
    );
  }
}
