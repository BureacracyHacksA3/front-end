import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class SearchBarContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Color(0xff293441), // culoarea containerului
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            width: 500,
            // padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Color(0xff293441), // culoarea băii de căutare
              border: Border.all(
                width: 2,
                color: Color(0xff896F4E),
              ),
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Introdu numele institutiei', // text de sugestie
                border: InputBorder.none, // eliminăm bordura
                suffixIcon: Icon(Icons.search,
                    color:
                        Colors.amber), // iconița de căutare cu culoarea aurie
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  flex: 1,
                  child: Image.asset(
                    'images/img-button.png', // prima imagine
                    fit: BoxFit.cover,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Image.asset(
                    'images/img-button.png', // a doua imagine
                    fit: BoxFit.cover,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Image.asset(
                    'images/img-button.png', // a treia imagine
                    fit: BoxFit.cover,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Image.asset(
                    'images/img-button.png', // a treia imagine
                    fit: BoxFit.cover,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Image.asset(
                    'images/img-button.png', // a treia imagine
                    fit: BoxFit.cover,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Image.asset(
                    'images/img-button.png', // a treia imagine
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
