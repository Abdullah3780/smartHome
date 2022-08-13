import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Room extends StatelessWidget {
  String roomtype;
  String noOfDevices;
  IconData iconData;
  GestureDetector? onTap;
  Room(
      {Key? key,
      required this.roomtype,
      required this.noOfDevices,
      required this.iconData,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.02,
          right: MediaQuery.of(context).size.width * 0.02,
          top: MediaQuery.of(context).size.height * 0.02,
          bottom: MediaQuery.of(context).size.height * 0.02),
      child: Container(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.02,
            right: MediaQuery.of(context).size.width * 0.02),
        height: MediaQuery.of(context).size.height * 0.075,
        width: MediaQuery.of(context).size.width * 0.35,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black54,
              blurRadius: 8,
              // spreadRadius: -12.0,

              // spreadRadius: 1,
              offset: Offset(0, 6)),
          // BoxShadow(color: Colors.white, blurRadius: 8, spreadRadius: -),
        ], borderRadius: BorderRadius.circular(6), color: Color(0xff4248C7)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                roomtype,
                textAlign: TextAlign.left,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text(
                noOfDevices + ' Devices',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          ),
          Icon(
            iconData,
            color: Colors.white,
          )
        ]),
      ),
    );
  }
}
