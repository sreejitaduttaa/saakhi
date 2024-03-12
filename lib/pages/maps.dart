import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://location-three-flax.vercel.app/'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  const Text('Maps'),
        titleTextStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        elevation: 1.0,
        backgroundColor: Colors.white,
        actions: [
          //mic
          Badge(
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.mic,
                color: Colors.grey[700],
              ),
            ),
          ),
          //camera
          Badge(
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.videocam_rounded,
                color: Colors.grey[700],
              ),
            ),
          ),
          //rotate
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.flip_camera_android_outlined,
              color: Colors.grey[700],
            ),
          ),

        ],
      ),
      body: Stack(
        children: [
          //map
          WebViewWidget(controller: controller),
        ],
      ),
    );
  }
}

//camera
// Positioned(
//   top: 20.0,
//   child: Container(
//     margin: EdgeInsets.all(10),
//     alignment: Alignment.center,
//     decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black54,
//             blurRadius: 4.0,
//           ),
//         ]),
//     height: 40,
//     width: 40,
//     child: IconButton(
//       onPressed: () {},
//       icon: Icon(
//         Icons.emergency_recording_rounded,
//         color: Colors.grey[700],
//       ),
//     ),
//   ),
// ),
//
// // microphone
// Positioned(
//   top: 70.0,
//   child: Container(
//     margin: EdgeInsets.all(10),
//     alignment: Alignment.center,
//     decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black54,
//             blurRadius: 4.0,
//           ),
//         ]),
//     height: 40,
//     width: 40,
//     child: IconButton(
//       onPressed: () {},
//       icon: Icon(
//         Icons.mic,
//         color: Colors.grey[700],
//       ),
//     ),
//   ),
// ),
//
// //zoomin
// Positioned(
//   top: 140.0,
//   child: Container(
//     margin: EdgeInsets.all(10),
//     alignment: Alignment.center,
//     decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black54,
//             blurRadius: 4.0,
//           ),
//         ]),
//     height: 40,
//     width: 40,
//     child: IconButton(
//       onPressed: () {},
//       icon: Icon(
//         Icons.zoom_in_rounded,
//         color: Colors.grey[700],
//       ),
//     ),
//   ),
// ),
//
// //zoomout
// Positioned(
//   top: 190,
//   child: Container(
//     margin: EdgeInsets.all(10),
//     alignment: Alignment.center,
//     decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black54,
//             blurRadius: 4.0,
//           ),
//         ]),
//     height: 40,
//     width: 40,
//     child: IconButton(
//       onPressed: () {},
//       icon: Icon(
//         Icons.zoom_out_rounded,
//         color: Colors.grey[700],
//       ),
//     ),
//   ),
// ),
//
// //layers
// Positioned(
//   right: 0.0,
//   top: 20.0,
//   child: Container(
//     margin: EdgeInsets.all(10),
//     alignment: Alignment.center,
//     decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black54,
//             blurRadius: 4.0,
//           ),
//         ]),
//     height: 40,
//     width: 40,
//     child: IconButton(
//       onPressed: () {},
//       icon: Icon(
//         Icons.layers_outlined,
//         color: Colors.grey[700],
//       ),
//     ),
//   ),
// ),
//
// // locate
// Positioned(
//   right: 0.0,
//   bottom: 70.0,
//   child: Container(
//     margin: EdgeInsets.all(10),
//     alignment: Alignment.center,
//     decoration: BoxDecoration(
//         color: Color(0xffC54CB4),
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black54,
//             blurRadius: 4.0,
//           ),
//         ]),
//     height: 50,
//     width: 50,
//     child: IconButton(
//       onPressed: () {},
//       icon: Icon(
//         Icons.my_location_outlined,
//         color: Colors.white,
//       ),
//     ),
//   ),
// ),
//
// // direction
// Positioned(
//   right: 0.0,
//   bottom: 10.0,
//   child: Container(
//     margin: EdgeInsets.all(10),
//     alignment: Alignment.center,
//     decoration: BoxDecoration(
//         color: Color(0xffC54CB4),
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black54,
//             blurRadius: 4.0,
//           ),
//         ]),
//     height: 50,
//     width: 50,
//     child: IconButton(
//       onPressed: () {},
//       icon: Icon(
//         Icons.navigation_outlined,
//         color: Colors.white,
//       ),
//     ),
//   ),
// ),
