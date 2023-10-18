import 'package:flutter/material.dart';
import 'package:picsum_photos_app/configs/colors.dart';
import 'package:picsum_photos_app/configs/string.dart';
import 'package:picsum_photos_app/login/login.dart';

class Sign extends StatefulWidget {
  const Sign({super.key});

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double screenHeight = MediaQuery.of(context).size.height;

    double containerWidth = screenWidth * 1;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            Tiltes.sign,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: AppColors.greenApp,
        ),
        // ignore: avoid_unnecessary_containers
        body: SingleChildScrollView(
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/logo_tran.png',
                    width: 200,
                    height: 200,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: Tiltes.new_username,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: Tiltes.password,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: Tiltes.re_password,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.greenApp,
                        fixedSize: Size(containerWidth, 50),
                      ),
                      onPressed: () {},
                      child: const Text(
                        Tiltes.sign,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Bạn đã có tài khoản?"),
                      TextButton(
                          onPressed: () {
                             Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                          },
                          child: const Text(
                            Tiltes.login,
                            style: TextStyle(
                                color: AppColors.blueApp,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ignore: avoid_unnecessary_containers
                      Container(
                        child: Image.asset(
                          "assets/images/facebook.png",
                          width: 40,
                          height: 40,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      // ignore: avoid_unnecessary_containers
                      Container(
                        child: Image.asset(
                          "assets/images/apple_logo.png",
                          width: 40,
                          height: 40,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      // ignore: avoid_unnecessary_containers
                      Container(
                        child: Image.asset(
                          "assets/images/google.png",
                          width: 40,
                          height: 40,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ));
  }
}
