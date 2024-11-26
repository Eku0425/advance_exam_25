import 'package:advance_exam_25/view/singup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 400, left: 65),
            child: GestureDetector(
              onTap: () {
                Get.to(SignupScreen());
              },
              child: Container(
                height: 180,
                width: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/4021/4021693.png')),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
