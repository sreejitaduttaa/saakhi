import 'package:flutter/material.dart';
// import 'package:badges/badges.dart';
import 'constants.dart';
import 'pages/home.dart';
import 'pages/chat.dart';
import 'pages/maps.dart';
import 'pages/settings.dart';

int currentTab = 0;
Widget currentScreen =  Home();

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<Widget> screens = [
    Home(),
    Chat(),
    Maps(),
    Settings(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: currentTab==2 ?kFloatingButtonActiveBackground : kFloatingButtonInactiveBackground,
        child: const Badge(
          alignment: AlignmentDirectional(30, -10) ,
          largeSize: 16, //height
          smallSize: 50, //diameter
          label: Text("1"),
          child:  ImageIcon(
            AssetImage("assets/icons/emergency.png"),
            size: 35,
            color: kFloatingButtonIcon,
          ),
        ),
        // const ImageIcon(
        //   AssetImage("assets/icons/emergency.png"),
        //   color: kFloatingButtonIcon,
        // ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: kNavBarColor,

        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child:  SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //left tab bar icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = Home();
                        currentTab=0;
                      });
                    },
                    child: ImageIcon(
                        AssetImage("assets/icons/home.png"),
                        color: currentTab==0 ? kNavBarItemActiveColor : kNavBarItemInactiveColor ,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = Chat();
                        currentTab=1;
                      });
                    },
                    child: ImageIcon(
                      AssetImage("assets/icons/chat.png"),
                      color:  currentTab==1 ? kNavBarItemActiveColor : kNavBarItemInactiveColor,
                    ),
                  ),
                ],
              ),
              //right tab bar icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = Maps();
                        currentTab=2;
                      });
                    },
                    child:  ImageIcon(
                        AssetImage("assets/icons/compass.png"),
                        color:  currentTab==2 ? kNavBarItemActiveColor : kNavBarItemInactiveColor,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = Settings();
                        currentTab=3;
                      });
                    },
                    child:ImageIcon(
                        AssetImage("assets/icons/settings.png"),
                        color:  currentTab==3 ? kNavBarItemActiveColor : kNavBarItemInactiveColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
