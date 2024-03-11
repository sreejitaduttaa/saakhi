import 'package:flutter/material.dart';
import 'home.dart';
import 'package:saakhi/dashboard.dart';

import 'package:easy_search_bar/easy_search_bar.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  String searchValue = '';
  final List<String> _suggestions = [
    'Afghanistan',
    'Albania',
    'Algeria',
    'Australia',
    'Brazil',
    'German',
    'Madagascar',
    'Mozambique',
    'Portugal',
    'Zambia'
  ];

  Future<List<String>> _fetchSuggestions(String searchValue) async {
    await Future.delayed(const Duration(milliseconds: 750));

    return _suggestions.where((element) {
      return element.toLowerCase().contains(searchValue.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: EasySearchBar(
            backgroundColor: Colors.white,
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_back_ios),
            //   onPressed: () {
            //     setState(() {
            //       currentScreen = Home();
            //       currentTab = 0;
            //     });
            //   },
            // ),
            elevation: 1.0,

            title: const Text('Maps'),
            titleTextStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 20,

            ),
            isFloating: true,
            showClearSearchIcon: true,
            searchHintText: "Where do you want to go?...",
            searchBackgroundColor: Colors.white,
            searchBackIconTheme: IconThemeData(
              color: Colors.grey[600],
            ),
            searchClearIconTheme: IconThemeData(
              color: Colors.grey[600],
            ),
            searchHintStyle: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),

            //searchValue will store the input text & the output
            onSearch: (value) => setState(() => searchValue = value),
            asyncSuggestions: (value) async => await _fetchSuggestions(value)),
        body: Stack(
          children: [

            //map
            Container(
              color: Colors.purple[100],
            ),

            //camera
            Positioned(
              top: 20.0,
              child: Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 4.0,
                      ),
                    ]),
                height: 40,
                width: 40,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.emergency_recording_rounded,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ),

            // microphone
            Positioned(
              top: 70.0,
              child: Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 4.0,
                      ),
                    ]),
                height: 40,
                width: 40,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.mic,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ),

            //zoomin
            Positioned(
              top: 140.0,
              child: Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 4.0,
                      ),
                    ]),
                height: 40,
                width: 40,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.zoom_in_rounded,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ),

            //zoomout
            Positioned(
              top: 190,
              child: Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 4.0,
                      ),
                    ]),
                height: 40,
                width: 40,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.zoom_out_rounded,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ),

            //layers
            Positioned(
              right: 0.0,
              top: 20.0,
              child: Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 4.0,
                      ),
                    ]),
                height: 40,
                width: 40,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.layers_outlined,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ),

            // locate
            Positioned(
              right: 0.0,
              bottom: 70.0,
              child: Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xffC54CB4),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 4.0,
                      ),
                    ]),
                height: 50,
                width: 50,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.my_location_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // direction
            Positioned(
              right: 0.0,
              bottom: 10.0,
              child: Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xffC54CB4),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 4.0,
                      ),
                    ]),
                height: 50,
                width: 50,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.navigation_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
