import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:saakhi/pages/globals.dart';
import 'package:shake/shake.dart';
import 'constants.dart';
import 'pages/home.dart';
import 'pages/chat.dart';
import 'pages/maps.dart';
import 'pages/settings.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:camera/camera.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:background_sms/background_sms.dart';

int currentTab = 0;
Widget currentScreen = Home();
int emergencyCount = 0;
int shakeCount = 0;
bool isRecording = false;
bool isAudioRecording = false;

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
  final String msg = "DANGER! \nhttps://emerngency-location.vercel.app/";
  late CameraController controller;
  late String videoPath;
  late List<CameraDescription> cameras;

  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    final camera = cameras.first;
    controller = CameraController(
      camera,
      ResolutionPreset.medium,
    );
    await controller.initialize();
  }

  void _startRecording() async {
    if (controller != null &&
        controller.value.isInitialized &&
        !controller.value.isRecordingVideo) {
      final videoPath = await controller.startVideoRecording();

        isRecording = true;


      // Start recording video
    }
  }

  void _stopRecording() async {
    if (controller != null && controller.value.isRecordingVideo) {
      final videoPath = await controller.stopVideoRecording();

      await GallerySaver.saveVideo(videoPath.path);
      File(videoPath.path).deleteSync();
      setState(() {
        isRecording = false;
      });
      // Process the recorded video
    }
  }

  void _videoRecording() {
    _startRecording();
    Future.delayed(Duration(seconds: 6), () {
      _stopRecording();
    });
  }

  Future initRecorder() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw 'Microphone permission not granted';
    }

    await recorder.openRecorder();
    isRecorderReady = true;
  }

  Future record() async {
    if (!isRecorderReady) return;
    await recorder.startRecorder(toFile: 'audio');


    setState(() {
      isAudioRecording = true;
    });
  }

  Future stop() async {
    if (!isRecorderReady) return;

    final path = await recorder.stopRecorder();
    isAudioRecording = false;

    final audioFile = File(path!);
    print('Recorded audio: $audioFile');
  }

  void _audioRecording() {
    record();
    Future.delayed(Duration(seconds: 6), () {
      stop();
    });
  }

  void _sendSMS(String message, List<String> recipents) async {
    sendSMS(message: message, recipients: recipents, sendDirect: true);
  }

  void _sendBackgroundSMS(String message, List<String> recipents) async {
    Future<bool> _isPermissionGranted() async =>
        await Permission.sms.status.isGranted;
    for (var i = 0; i < recipents.length; i++)
    // void _sendMessage(String phoneNumber, String message) async {
    {
      var result = await BackgroundSms.sendMessage(
          phoneNumber: recipents[i], message: message);
      print("Message sent");
    }
    // }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        showCloseIcon: true,
        closeIconColor: Colors.black87,
        content: Container(
          height: 90,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ImageIcon(
                AssetImage("assets/icons/confirm.png"),
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Succesful!",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Text(
                      message,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
  }

  void _incrementCounter() {
    print("pressed $emergencyCount");
    if (currentTab == 2) {
      setState(() {
        emergencyCount++;

        _countFeatures(emergencyCount);
      });
    } else {
      setState(() {
        // emergencyCount++;
        currentScreen = const Maps();
        currentTab = 2;
        // _countFeatures(emergencyCount);
      });
    }
  }

  void _countFeatures(int emergencyCount) {
    if (emergencyCount == 1) {
      _sendSMS(msg, contacts);
      _showSnackBar("Location sent to guardians!");
    } else if (emergencyCount == 2) {
      _showSnackBar("Location sent to police main server!");
    } else if (emergencyCount == 3) {
      _showSnackBar("Location sent to police local server, TO YOUR HELP!");

      _videoRecording();
      _audioRecording();
    }
  }

  void _shakeFeatures(int shakeCount) {
    if (shakeCount == 1) {
      _sendBackgroundSMS(msg, contacts);
      _showSnackBar("Location sent to guardians!");
    } else if (shakeCount == 2) {
      _showSnackBar("Location sent to police main server!");
    } else if (shakeCount == 3) {
      _showSnackBar("Location sent to police local server, TO YOUR HELP!");

      // _videoRecording();
      // _audioRecording();
    }
  }

  @override
  void initState() {
    super.initState();

    initializeCamera();
    initRecorder();
    // Permission.sms.request();

    _getPermission() async => await [
          Permission.sms,
        ].request();

    ShakeDetector detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        setState(() {
          shakeCount++;
          emergencyCount++;
          _shakeFeatures(shakeCount);
        });
      },
      minimumShakeCount: 1,
      shakeSlopTimeMS: 1000,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 2.7,
    );
    // To close: detector.stopListening();
    // ShakeDetector.waitForStart() waits for user to call detector.startListening();
  }

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
