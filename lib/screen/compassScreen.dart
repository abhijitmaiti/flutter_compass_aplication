import 'dart:math';
import 'package:campass/screen/bubbleLevelScreen.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:smooth_compass/utils/src/compass_ui.dart';

class CompassScreen extends StatefulWidget {
  const CompassScreen({super.key});

  @override
  State<CompassScreen> createState() => _CompassScreenState();
}

class _CompassScreenState extends State<CompassScreen> {
  int currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SmoothCompass(compassBuilder: (context, snapshot, child) {
          return Container(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                      margin: const EdgeInsets.only(top: 40),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage("assets/images/splace_font_image.png"),
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.center,
                    child: DotsIndicator(
                      dotsCount: 2,
                      position: currentPage,
                      decorator: DotsDecorator(
                        size: const Size.square(9),
                        activeColor: Colors.white,
                        activeSize: const Size(18, 9),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    // child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: List.generate(
                    //     2,
                    //     (index) => dotIndicator(index),
                    //   ),
                    // ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (value) {
                      currentPage = value;
                    },
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return Stack(children: [
                          Center(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 10, top: 5),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/reading.png"),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                                child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: directionText(
                                        snapshot?.data?.angle.toInt() ?? 0),
                                    style: const TextStyle(
                                        fontSize: 40, color: Colors.white))
                              ]),
                            )),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 17,
                                left: 10,
                                right: 10,
                                bottom: 5,
                              ),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * .28,

                                child: AnimatedRotation(
                                  turns: snapshot?.data?.turns ?? 0,
                                  duration: const Duration(milliseconds: 400),
                                  child:
                                      Image.asset("assets/images/neddel.png"),
                                ),
                                //
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * .18,
                                width: MediaQuery.of(context).size.height * .18,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.white54,
                                ),
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              " ${snapshot?.data?.angle.toInt() ?? 0}°",
                                          style: const TextStyle(
                                            fontSize: 40,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ]);
                      } else {
                        return BubbleLevelScreen();
                      }
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Container(
                        child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(children: [
                        TextSpan(
                          text: "Devlop by jeetu\n\n",
                          style: TextStyle(
                              letterSpacing: 2, color: Colors.white38),
                        ),
                        TextSpan(
                            text: "© Version 1.0.1.0",
                            style:
                                TextStyle(color: Colors.white38, fontSize: 12))
                      ]),
                    )),
                  ),
                )
              ],
            ),
          );
        }));
  }

  String directionText(int direction) {
    if (direction <= 30 && direction > 0) {
      return "N";
    } else if (direction <= 330 && direction > 300) {
      return "NE";
    } else if (direction <= 300 && direction > 240) {
      return "E";
    } else if (direction <= 240 && direction > 210) {
      return "SE";
    } else if (direction <= 210 && direction > 150) {
      return "S";
    } else if (direction <= 150 && direction > 120) {
      return "SW";
    } else if (direction <= 120 && direction > 60) {
      return "W";
    } else if (direction <= 60 && direction > 30) {
      return "NW";
    } else {
      return "N";
    }
  }
}
