import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../reuseablewidgets/light.dart';

class LightPage extends StatefulWidget {
  void Function(bool val) onPressed;
  LightPage({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<LightPage> createState() => _LightPageState();
}

class _LightPageState extends State<LightPage> {
  double opacityOfLight = 0.5;
  var sliderValue = 0.5;

  String onOrOff = 'Off';
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: ExactAssetImage('assets/Light.png'),
          fit: BoxFit.fill,
        )),
        child: Column(
          children: [
            Opacity(
              opacity: opacityOfLight,
              child: Image.asset(
                'assets/Pendant.png',
                height: MediaQuery.of(context).size.height * 0.6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Lights',
                          style: TextStyle(
                              color: Color(0xffB8C1C7),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '3 Devices',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0xffA7A7A7),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.13,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black54,
                                blurRadius: 8,
                                // spreadRadius: -12.0,

                                // spreadRadius: 1,
                                offset: Offset(0, 6)),
                            // BoxShadow(color: Colors.white, blurRadius: 8, spreadRadius: -),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff313336)),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.01,
                            left: MediaQuery.of(context).size.width * 0.05,
                            bottom: MediaQuery.of(context).size.width * 0.01),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Pendant',
                                        style: TextStyle(
                                            color: Color(0xffAEBABF),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        onOrOff,
                                        style: TextStyle(
                                          color: Color(0xff677A86),
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        widget.onPressed(false);
                                      },
                                      icon: Icon(
                                        Icons.cancel,
                                        color: Color(0xffAEBABF),
                                      ))
                                ],
                              ),
                              CupertinoSlider(
                                value: sliderValue,
                                activeColor: Color(0xffA9A9A9),
                                thumbColor: Color(0xff242628),
                                min: 0.5,
                                max: 1,
                                // divisions: 1,
                                onChanged: (value) {
                                  sliderValue = value;
                                  opacityOfLight = value;
                                  setState(() {
                                    if (value >= 0.56) {
                                      onOrOff = 'On';
                                    } else {
                                      onOrOff = 'Off';
                                    }
                                  });
                                },
                              )
                            ]),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
