import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saakhi/constants.dart';
import 'package:saakhi/models/helpline.dart';


class HelplineTile extends StatelessWidget {
  final HelplineModel helplines;

  // _callNumber(String number) async{
  //   await FlutterPhoneDirectCaller.callNumber(number);
  // }

  const HelplineTile({
    super.key,
    required this.helplines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: kHelplineTileColor,
        borderRadius: BorderRadius.circular(20),
      ),
      width: 220,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //image
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset(
              helplines.iconPath,
              height: 100,
              color: Colors.black,
              alignment: Alignment.center,
            ),
          ),

          //title
          Text(
            helplines.helplineName,
            textAlign: TextAlign.left,
            style: GoogleFonts.radioCanada(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),

          //button
          InkWell(
            onTap: () {
              FlutterPhoneDirectCaller.callNumber(helplines.helplineNumber);
            },
            child: Container(
              height: 45,
              width: 120,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    const Color(0xffF47D7D),
                    const Color(0xffD35252)
                  ]),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 2.0,
                    ),
                  ]),
              child: Center(
                child: Text(
                  "Call ${helplines.helplineNumber}",
                  style: GoogleFonts.radioCanada(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
