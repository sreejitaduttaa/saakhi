import 'package:flutter/material.dart';
import 'package:saakhi/pages/globals.dart';
import 'package:shake/shake.dart';
// import 'package:badges/badges.dart';
import 'constants.dart';
import 'pages/home.dart';
import 'pages/chat.dart';
import 'pages/maps.dart';
import 'pages/settings.dart';
import 'package:flutter_sms/flutter_sms.dart';

int currentTab = 0;
Widget currentScreen = Home();
int emergencyCount = 0;

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
  final List<String> contacts = EmergencyContact().getContacts();
  final String msg = "DANGER! \n https://location-three-flax.vercel.app/";

  void _sendSMS(String message, List<String> recipents) async {
    sendSMS(message: message, recipients: recipents,sendDirect: true);
  }

  void _incrementCounter() {
    print("pressed $emergencyCount");
    if (currentTab == 2) {
      setState(() {
        emergencyCount++;
        countFeatures(emergencyCount);
      });
    } else {
      setState(() {
        emergencyCount++;
        currentScreen = const Maps();
        currentTab = 2;
        countFeatures(emergencyCount);
      });
    }
  }

  void countFeatures(int emergencyCount ){
    if (emergencyCount == 1) {
      _sendSMS(msg, contacts);
    } else if (emergencyCount == 2) {
    } else if (emergencyCount == 3) {}

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        backgroundColor: currentTab == 2
            ? kFloatingButtonActiveBackground
            : kFloatingButtonInactiveBackground,
        child: Badge(
          alignment: const AlignmentDirectional(30, -10),
          isLabelVisible: (emergencyCount > 0) ? true : false,
          largeSize: 20, //height
          smallSize: 120, //diameter
          label: (emergencyCount > 0 && emergencyCount <= 3)
              ? Text("$emergencyCount")
              : const Text("3"),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          child: const ImageIcon(
            AssetImage("assets/icons/emergency.png"),
            size: 35,
            color: kFloatingButtonIcon,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: kNavBarColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: SizedBox(
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
                        currentTab = 0;
                      });
                    },
                    child: ImageIcon(
                      AssetImage("assets/icons/home.png"),
                      color: currentTab == 0
                          ? kNavBarItemActiveColor
                          : kNavBarItemInactiveColor,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = Chat();
                        currentTab = 1;
                      });
                    },
                    child: ImageIcon(
                      AssetImage("assets/icons/chat.png"),
                      color: currentTab == 1
                          ? kNavBarItemActiveColor
                          : kNavBarItemInactiveColor,
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
                        currentTab = 2;
                      });
                    },
                    child: ImageIcon(
                      AssetImage("assets/icons/compass.png"),
                      color: currentTab == 2
                          ? kNavBarItemActiveColor
                          : kNavBarItemInactiveColor,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = Settings();
                        currentTab = 3;
                      });
                    },
                    child: ImageIcon(
                      AssetImage("assets/icons/settings.png"),
                      color: currentTab == 3
                          ? kNavBarItemActiveColor
                          : kNavBarItemInactiveColor,
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
