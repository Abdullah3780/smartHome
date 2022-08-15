import 'package:bcj/screens/LightPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Light extends StatelessWidget {
  String sceneName;
  bool showlighpage;
  BuildContext ctx;
  // IconData sceneIconData;
  void Function(bool val) onPressed;
  bool value;

  Light(
      {Key? key,
      required this.sceneName,
      required this.value,
      required this.showlighpage,
      required this.onPressed,
      required this.ctx})
      : super(key: key);

  String onOrOff = 'Off';

  @override
  Widget build(BuildContext context) {
    context = ctx;
    return Container(
      height: MediaQuery.of(context).size.height * 0.105,
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black54,
            blurRadius: 8,
            // spreadRadius: -12.0,

            // spreadRadius: 1,
            offset: Offset(0, 6)),
        // BoxShadow(color: Colors.white, blurRadius: 8, spreadRadius: -),
      ], borderRadius: BorderRadius.circular(10), color: Color(0xff313336)),
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * 0.01,
            bottom: MediaQuery.of(context).size.width * 0.01),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sceneName,
                style: TextStyle(
                    color: Color(0xffAEBABF), fontWeight: FontWeight.bold),
              ),
              Text(
                value == true ? 'On' : 'Off',
                style: TextStyle(
                  color: Color(0xff677A86),
                ),
              ),
              CupertinoSwitch(
                activeColor: Color(0XFFA9A9A9),
                value: value,
                trackColor: Color(0xff1B1D1F),
                thumbColor: Color(0xff242628),
                onChanged: onPressed,
              ),
            ]),
      ),
    );
  }
}
