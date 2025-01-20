import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lewedly/presentations/constants/constants.dart';
import 'package:lewedly/presentations/constants/strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2000), () {
      Navigator.pushNamedAndRemoveUntil(context, loginPage, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              primarycolor,
              pdarkcolor,
            ],
            stops: [0.5, 1],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SvgPicture.asset(
            //   "assets/svg/logo.svg",
            //   height: (125),
            // ),
            // spaceLong(15),
            Text(
              "LEWEDLY",
              style: textstyle.copyWith(
                  fontSize: (55),
                  fontWeight: FontWeight.w800,
                  color: whitecolor),
            ),
          ],
        ),
      ),
    );
  }
}
