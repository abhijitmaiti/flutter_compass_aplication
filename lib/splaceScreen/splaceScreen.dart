import 'dart:async';
import 'package:campass/screen/compassScreen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 5),
      () => Navigator.of(context).pushReplacement(
        PageTransition(
            child: const CompassScreen(),
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 30)),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/splace_font_image.png"),
                    fit: BoxFit.cover,
                  ),
                )),
          ),
          Expanded(
            flex: 6,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/splace_image.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(children: [
                  TextSpan(
                    text: "Devlop by jeetu\n\n",
                    style: TextStyle(letterSpacing: 2, color: Colors.white38),
                  ),
                  TextSpan(
                      text: "© Version 1.0.1.0",
                      style: TextStyle(color: Colors.white38, fontSize: 12))
                ]),
              ),
            ),
          )
        ],
      )),
    );
  }
}
