import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipApp/Mobile/HistoryDocumentsMobile.dart';
import 'package:ipApp/Mobile/ProfilePageMobile.dart';

class AccountPageMobile extends StatefulWidget {
  const AccountPageMobile({Key? key}) : super(key: key);

  @override
  State<AccountPageMobile> createState() => _AccountPageMobileState();
}

class _AccountPageMobileState extends State<AccountPageMobile> {

  bool _homeAction = false;
  bool _institutieAction = false;
  bool _contactAction = false;
  bool _contumeuAction = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Account Page',
      home: Scaffold(
        backgroundColor: Color(0xFF101c2b),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(top:30),
              child: Text(
                'Welcome, Guest!',
                style: TextStyle(
                  fontFamily: 'Book Antiqua Font',
                  fontSize: 25,
                  color: Color(0xFFe5e7e8),
                ),
              ),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(
                  'assets/images/city.png',
                  height: 530,
                  width: 500,
                  fit: BoxFit.cover,
                ),
                Opacity(
                  opacity: 0.95,
                  child: Container(
                    padding: EdgeInsets.only(top: 50, bottom: 0),
                    child: Container(
                      width: 500,
                      height: 480,
                      decoration: BoxDecoration(
                        color: Color(0xFF293441),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'My Account',
                              style: TextStyle(
                                fontSize: 35,
                                color: Color(0xFFe5e7e8),
                                fontFamily: 'Louis George Cafe',
                              ),
                            ),
                          ),
                          Container(
                            height: 80,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0xFFe5e7e8),
                                  width: 1.5,
                                ),
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () =>
                                  Navigator.of(context).push(new MaterialPageRoute(
                                      builder: (BuildContext context) => new ProfilePage())),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(top: 20, left: 10),
                                    child: Image.asset(
                                      'assets/images/date_personale.png',
                                      width: 75,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 15, left: 0),
                                    child: Text(
                                      'Personal Data',
                                      style: TextStyle(
                                        color: Color(0xFFe5e7e8),
                                        fontFamily: 'Louis George Cafe',
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 80,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0xFFe5e7e8),
                                  width: 1.5,
                                ),
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () =>
                                  Navigator.of(context).push(new MaterialPageRoute(
                                      builder: (BuildContext context) => new HistoryDocuments())),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(top: 18, left: 10),
                                    child: Image.asset(
                                      'assets/images/istoricul_cautarilor.png',
                                      width: 75,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 15, left: 0),
                                    child: Text(
                                      'Search History',
                                      style: TextStyle(
                                        color: Color(0xFFe5e7e8),
                                        fontFamily: 'Louis George Cafe',
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 80,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0xFFe5e7e8),
                                  width: 1.5,
                                ),
                              ),
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(top: 20, left: 10),
                                  child: Image.asset(
                                    'assets/images/schimbare_parola.png',
                                    width: 75,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 15, left: 0),
                                  child: Text(
                                    'Change Password',
                                    style: TextStyle(
                                      color: Color(0xFFe5e7e8),
                                      fontFamily: 'Louis George Cafe',
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 80,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0xFFe5e7e8),
                                  width: 1.5,
                                ),
                              ),
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(top: 20, left: 10),
                                  child: Image.asset(
                                    'assets/images/document_in_decurs.png',
                                    width: 70,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 15, left: 0),
                                  child: Text(
                                    'Documents',
                                    style: TextStyle(
                                      color: Color(0xFFe5e7e8),
                                      fontFamily: 'Louis George Cafe',
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 80,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0xFFe5e7e8),
                                  width: 1.5,
                                ),
                              ),
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(top: 20, left: 10),
                                  child: Image.asset(
                                    'assets/images/deconectare.png',
                                    width: 75,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 15, left: 0),
                                  child: Text(
                                    'LogOut',
                                    style: TextStyle(
                                      color: Color(0xFFe5e7e8),
                                      fontFamily: 'Louis George Cafe',
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _homeAction = !_homeAction;
                    });
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: _homeAction ?
                        Image.asset(
                          'assets/images/home2.png',
                          width: 45,
                        ) :
                        Image.asset(
                          'assets/images/home1.png',
                          width: 45,
                        ),
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                          fontFamily: 'Louis George Cafe',
                          color: Color(0xFFe5e7e8),
                        ),
                      ),
                    ],
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      _institutieAction = !_institutieAction;
                    });
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: _institutieAction ?
                        Image.asset(
                          'assets/images/institutie2.png',
                          width: 45,
                        ) :
                        Image.asset(
                          'assets/images/institutie1.png',
                          width: 45,
                        ),
                      ),
                      Text(
                        'Institution',
                        style: TextStyle(
                          fontFamily: 'Louis George Cafe',
                          color: Color(0xFFe5e7e8),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _contactAction = !_contactAction;
                    });
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: _contactAction ?
                        Image.asset(
                          'assets/images/contact2.png',
                          width: 45,
                        ) :
                        Image.asset(
                          'assets/images/contact1.png',
                          width: 45,
                        ),
                      ),
                      Text(
                        'Contact',
                        style: TextStyle(
                          fontFamily: 'Louis George Cafe',
                          color: Color(0xFFe5e7e8),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _contumeuAction = !_contumeuAction;
                    });
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: _contumeuAction ?
                        Image.asset(
                          'assets/images/contul_meu2.png',
                          width: 45,
                        ) :
                        Image.asset(
                          'assets/images/contul_meu1.png',
                          width: 45,
                        ),
                      ),
                      Text(
                        'Account',
                        style: TextStyle(
                          fontFamily: 'Louis George Cafe',
                          color: Color(0xFFe5e7e8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
