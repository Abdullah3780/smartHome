import 'package:flutter/material.dart';

class Scene extends StatelessWidget {
  String sceneName;

  IconData sceneIconData;

  Scene({Key? key, required this.sceneName, required this.sceneIconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black54,
            blurRadius: 8,
            // spreadRadius: -12.0,

            // spreadRadius: 1,
            offset: Offset(0, 6)),
        // BoxShadow(color: Colors.white, blurRadius: 8, spreadRadius: -),
      ], borderRadius: BorderRadius.circular(5), color: Color(0xff313336)),
      child: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.01,
            right: MediaQuery.of(context).size.width * 0.01),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            sceneName,
            style: TextStyle(color: Color(0xffAEBABF)),
          ),
          Icon(sceneIconData, color: Color(0xffAEBABF))
        ]),
      ),
    );
  }
}
