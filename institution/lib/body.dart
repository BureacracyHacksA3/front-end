import 'package:flutter/material.dart';
import './institution.dart';
import './searchBarContainer.dart';
import './InsitutionMobile.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 790) {
      // Return SearchBarContainer() pentru telefoane
      return Column(
        children: <Widget>[
          SearchBarContainer(),
          InstitutionMobile(),
        ],
      );
    } else {
      // Return Institution() pentru desktop
      return Column(
        children: <Widget>[
          SearchBarContainer(),
          Institution(),
        ],
      );
    }
  }
}
