import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saakhi/models/helpline.dart';

import '../constants.dart';
import '../home_widgets/helpline_tile.dart';
import 'globals.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<HelplineModel> helplines = [];
  final List<String> contacts = EmergencyContact().getContacts();

  void _getInitialInfo() {
    helplines = HelplineModel.getHelplines();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffDF57B9),
          title: Text(
            "Saakhi",
            style: GoogleFonts.comfortaa(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          leading: Icon(Icons.notifications_none_outlined),
        ),
        backgroundColor: kHomeBgColor,
        body: ListView(
          children: [
            //Hello message
            const _headingSection(),

            const SizedBox(
              height: 20,
            ),

            //1st box(emergency helpline numbers)

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Emergency Helplines",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.radioCanada(
                      fontSize: 24,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 240,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 25,
                    ),
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    itemCount: helplines.length,
                    itemBuilder: (context, index) => HelplineTile(
                      helplines: helplines[index],
                    ),
                  ),
                )
              ],
            ),

            //2nd box
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Emergency Contacts",
                textAlign: TextAlign.left,
                style: GoogleFonts.radioCanada(
                  fontSize: 24,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color(0xff82C0D3),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 120,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // left title
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Guardians",
                          style: GoogleFonts.radioCanada(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                          ),
                        ),
                        Text(
                          "${contacts.length}/5",
                          style: GoogleFonts.radioCanada(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                  ),
                  //circular avatar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
                    children: [
                      Row(
                        children: [
                          for (int i = 0; i < contacts.length; i++)
                            Align(
                              widthFactor: 0.5,
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Color(0xff82C0D3),
                                child: CircleAvatar(
                                  radius: 22,
                                  backgroundImage:
                                      AssetImage("assets/icons/user.png"),
                                ),
                              ),
                            )
                        ],
                      ),
                      SizedBox(width: 10,),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 30,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

            //3rd box
          ],
        ));
  }
}

class _headingSection extends StatelessWidget {
  const _headingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 30,
        ),
        const ImageIcon(
          AssetImage("assets/icons/sun.png"),
          color: kHomePageHeadingColor,
          size: 25,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "How you doing, Sreejita?",
          textAlign: TextAlign.center,
          style: GoogleFonts.comfortaa(
            fontSize: 18,
            color: kHomePageHeadingColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Hope you've a good day!",
          textAlign: TextAlign.center,
          style: GoogleFonts.comfortaa(
            fontSize: 12,
            color: kHomePageHeadingColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
