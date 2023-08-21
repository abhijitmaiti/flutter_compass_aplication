import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class BubbleLevelScreen extends StatefulWidget {
  @override
  _BubbleLevelScreenState createState() => _BubbleLevelScreenState();
}

class _BubbleLevelScreenState extends State<BubbleLevelScreen> {
  double xValue = 0.0;
  double yValue = 0.0;

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((event) {
      setState(() {
        xValue = event.x;
        yValue = event.y;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Center(
            child: Container(
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: Transform.rotate(
                        angle: xValue,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          height: MediaQuery.of(context).size.height * .42,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/balencer_reading.png"),
                                fit: BoxFit.contain),
                          ),
                        ),
                      )),
                  Align(
                    alignment: Alignment.center,
                    child: Transform.rotate(
                      angle: yValue,
                      child: Container(
                        margin: const EdgeInsets.only(
                          bottom: 10,
                          left: 10,
                          top: 5,
                        ),
                        height: MediaQuery.of(context).size.height * .25,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/balencer_reading.png"),
                              fit: BoxFit.contain),
                        ),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white54,
                    ),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: (xValue.toStringAsFixed(1) == "0.0" &&
                                yValue.toStringAsFixed(1) == "0.0")
                            ? Colors.green
                            : Colors.red,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "${xValue.toStringAsFixed(1)}",
                                  style: const TextStyle(fontSize: 40)),
                            ])),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "${yValue.toStringAsFixed(1)}",
                                  style: const TextStyle(fontSize: 40)),
                            ])),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
