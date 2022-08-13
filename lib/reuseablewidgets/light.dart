import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Light extends StatefulWidget {
  String sceneName;

  // IconData sceneIconData;

  bool value;

  Light({Key? key, required this.sceneName, required this.value})
      : super(key: key);

  @override
  State<Light> createState() => _LightState();
}

class _LightState extends State<Light> {
  @override
  Widget build(BuildContext context) {
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
                widget.sceneName,
                style: TextStyle(
                    color: Color(0xffAEBABF), fontWeight: FontWeight.bold),
              ),
              Text(
                'Off',
                style: TextStyle(
                  color: Color(0xff677A86),
                ),
              ),
              CupertinoSwitch(
                  activeColor: Color(0XFFA9A9A9),
                  value: widget.value,
                  trackColor: Color(0xff1B1D1F),
                  thumbColor: Color(0xff242628),
                  onChanged: (val) {
                    setState(() {
                      widget.value = val;
                    });
                  }),
            ]),
      ),
    );
  }
}
