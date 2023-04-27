import 'package:flutter/material.dart';

class Institution extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: Row(
        children: <Widget>[
          Column(
            children: [
              Column(
                children: [
                  Image.asset(
                    'images/primaria.png',
                    width: 300,
                    height: 300,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Primaria Municipiului Iasi",
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 50),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(
                              0xff896F4E), // aici setezi culoarea butonului
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                16), // aici setezi forma butonului
                          ),
                        ),
                        onPressed: () {
                          // aici poți adăuga acțiunea pe care vrei să o facă butonul când este apăsat
                        },
                        child: Text(
                          'Vezi Feedback', // aici poți seta textul butonului
                          style: TextStyle(
                            color: Colors
                                .black, // aici setezi culoarea textului butonului
                            fontSize:
                                16, // aici setezi mărimea textului butonului
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Text(
                              "Contact:",
                              style: TextStyle(fontSize: 30),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Row(children: [
                          Padding(
                            padding: EdgeInsets.only(left: 50),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 25),
                                  ),
                                  Icon(
                                    Icons.phone,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                  Text(
                                    'Email: grupaA3@gmail.com',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 25),
                                  ),
                                  Icon(
                                    Icons.fax,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                  Text(
                                    'Email: grupaA3@gmail.com',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 25),
                                  ),
                                  Icon(
                                    Icons.web,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                  Text(
                                    'Email: grupaA3@gmail.com',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 25),
                                  ),
                                  Icon(
                                    Icons.email,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                  Text(
                                    'Email: grupaA3@gmail.com',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ]),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 150),
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Text(
                              "Program:",
                              style: TextStyle(fontSize: 30),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Row(children: [
                          Padding(
                            padding: EdgeInsets.only(left: 50),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 25),
                                  ),
                                  Icon(
                                    Icons.email,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                  Text(
                                    'Email: grupaA3@gmail.com',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 25),
                                  ),
                                  Icon(
                                    Icons.email,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                  Text(
                                    'Email: grupaA3@gmail.com',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 25),
                                  ),
                                  Icon(
                                    Icons.email,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                  Text(
                                    'Email: grupaA3@gmail.com',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 25),
                                  ),
                                  Icon(
                                    Icons.email,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                  Text(
                                    'Email: grupaA3@gmail.com',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ]),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Text(
                              "Adresa:",
                              style: TextStyle(fontSize: 30),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Row(children: [
                          Padding(
                            padding: EdgeInsets.only(left: 50),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 25),
                                  ),
                                  Icon(
                                    Icons.location_city_rounded,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                  Text(
                                    'Email: grupaA3@gmail.com',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ]),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
