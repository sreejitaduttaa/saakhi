import 'package:flutter/material.dart';

class HelplineModel {
  String iconPath;
  String helplineName;
  String helplineNumber;

  HelplineModel({
    required this.iconPath,
    required this.helplineName,
    required this.helplineNumber,
  });

  static List<HelplineModel> getHelplines() {
    List<HelplineModel> categories = [];


    categories.add(HelplineModel(
      helplineName: 'Women Helpline',
      helplineNumber: '1091',
      iconPath: 'assets/icons/women.png',
    ));

    categories.add(HelplineModel(
      helplineName: 'Domestic Abuse',
      helplineNumber: '181',
      iconPath: 'assets/icons/domestic_violence.png',
    ));

    categories.add(HelplineModel(
      helplineName: 'Police ',
      helplineNumber: '100',
      iconPath: 'assets/icons/police.png',
    ));

    categories.add(HelplineModel(
      helplineName: 'Ambulance ',
      helplineNumber: '102',
      iconPath: 'assets/icons/ambulance.png',
    ));

    categories.add(HelplineModel(
      helplineName: 'National Emergency',
      helplineNumber: '112',
      iconPath: 'assets/icons/national_helpline.png',
    ));

    categories.add(HelplineModel(
      helplineName: 'Aids Helpline',
      helplineNumber: '1097',
      iconPath: 'assets/icons/aids.png',
    ));


    return categories;
  }
}
