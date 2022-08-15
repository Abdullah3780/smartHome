import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:bcj/reuseablewidgets/scene.dart';
import 'package:bcj/screens/LightPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../reuseablewidgets/light.dart';
import '../reuseablewidgets/room.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;
  bool showlightpage = false;

  var onOffForLamp = false;

  var onOffForOverhead = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter, end: Alignment.bottomCenter,
                        // stops: [50, 40],
                        colors: [Color(0xff577EFF), Color(0xff660BC1)])),
                child: Icon(Icons.mic)),
            onPressed: () {}),
        body: showlightpage
            ? LightPage(
                onPressed: (val) {
                  setState(() {
                    showlightpage = val;
                  });
                },
              )
            : Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Color(0xff24272C), Color(0xff1E2124)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  // stops: [4, 4]
                )),
                child: SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.05,
                            right: MediaQuery.of(context).size.width * 0.05,
                            top: MediaQuery.of(context).size.height * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset('assets/Menu.svg'),
                            Text(
                              'Home Sweet Home',
                              style: TextStyle(color: Color(0xffB8C1C7)),
                            ),
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                              width: MediaQuery.of(context).size.width * 0.055,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4)),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Room(
                                  selected: true,
                                  roomtype: 'Living Room',
                                  noOfDevices: '3',
                                  iconData: Icons.living),
                              Room(
                                selected: false,
                                roomtype: 'Bedroom',
                                noOfDevices: '4',
                                iconData: Icons.bedroom_parent,
                              ),
                              Room(
                                selected: false,
                                roomtype: 'Kitchen',
                                noOfDevices: '2',
                                iconData: Icons.kitchen,
                              )
                            ],
                          )),
                      SleekCircularSlider(
                          appearance: CircularSliderAppearance(),
                          onChange: (double value) {
                            print(value);
                          }),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Scenes',
                                    style: TextStyle(
                                        color: Color(0xffB8C1C7),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Icon(
                                    Icons.add_circle,
                                    color: Color(0xffB8C1C7),
                                  )
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Scene(
                                    sceneName: 'Sleep',
                                    sceneIconData: Icons.nightlight,
                                  ),
                                  Scene(
                                      sceneName: 'Awake',
                                      sceneIconData: Icons.sunny),
                                  Scene(
                                    sceneName: 'Workout',
                                    sceneIconData: Icons.watch,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Lights',
                                    style: TextStyle(
                                        color: Color(0xffB8C1C7),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Icon(
                                    Icons.more_vert,
                                    color: Color(0xff42474C),
                                  )
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
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Light(
                                    sceneName: 'Overhead',
                                    value: onOffForOverhead,
                                    onPressed: (val) {
                                      setState(() {
                                        onOffForOverhead = !onOffForOverhead;
                                      });
                                    },
                                    showlighpage: showlightpage,
                                    ctx: context,
                                  ),
                                  Light(
                                    sceneName: 'Lamp',
                                    value: onOffForLamp,
                                    showlighpage: showlightpage,
                                    onPressed: (val) {
                                      setState(() {
                                        onOffForLamp = !onOffForLamp;
                                        // showlightpage = val;
                                      });
                                    },
                                    ctx: context,
                                  ),
                                  Light(
                                    sceneName: 'Pendant',
                                    value: false,
                                    showlighpage: showlightpage,
                                    onPressed: (val) {
                                      setState(() {
                                        showlightpage = val;
                                      });
                                    },
                                    ctx: context,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
        bottomNavigationBar: Material(
          color: Color(0xff1E2124),
          child: AnimatedBottomNavigationBar(
              backgroundColor: Color(0xff1E2124),
              inactiveColor: Color(0xff979EA3),
              activeColor: Colors.white,
              leftCornerRadius: 32,
              safeAreaValues:
                  SafeAreaValues(bottom: true, right: true, left: true),
              rightCornerRadius: 32,
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.sharpEdge,
              shadow: BoxShadow(
                  color: Colors.black54,
                  blurRadius: 8,
                  // spreadRadius: -12.0,

                  // spreadRadius: 1,
                  offset: Offset(0, 6)),
              // BoxShadow(color: Colors.white, blurRadius: 8, spreadRadius: -),

              icons: [
                Icons.home_outlined,
                Icons.query_stats,
                Icons.notifications,
                Icons.settings
              ],
              activeIndex: activeIndex,
              onTap: (val) {
                setState(() {
                  activeIndex = val;
                });
              }),
        ));
    // BottomNavigationBar(
    // showSelectedLabels: true,
    // selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
    // selectedItemColor: Colors.white,
    // unselectedItemColor: Color(0xff979EA3),
    // type: BottomNavigationBarType.fixed,
    // backgroundColor: Color(0xff24272A),
    // items: [
    //   BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    //   BottomNavigationBarItem(
    //       icon: Icon(
    //         Icons.query_stats,
    //       ),
    //       label: 'Stats'),
    //   BottomNavigationBarItem(
    //       icon: Icon(Icons.notifications), label: 'Alerts'),
    //   BottomNavigationBarItem(
    //       icon: Icon(Icons.settings), label: 'Settings'),
    // ]),
    // );
  }
}
