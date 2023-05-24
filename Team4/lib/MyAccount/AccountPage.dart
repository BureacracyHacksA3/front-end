import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipApp/MyAccount/HistoryDocuments.dart';
import 'package:ipApp/MyAccount/ProfilePage.dart';
import 'package:ipApp/MyAccount/DocumentsPage.dart';

import '../../bottom_navigation_bar.dart';
import '../../colors.dart';
import '../Contact/main.dart';
import '../Home/landing.dart';
import '../Institution/institutions/main.dart';
import '../Login/login.dart';
import '../Register/register.dart';
import '../SuperAdmin/superadmin.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
        appBar: AdaptiveNavBar(
            screenWidth: MediaQuery.of(context).size.width,
            backgroundColor: const Color(0xFF101C2B),
            leading: Image.asset(
              'images/logo-ip.png',
              width: 50,
              height: 50,
            ),
            navBarItems: [
              NavBarItem(
                text: "Home",
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new MyApp()));
                },
              ),
              NavBarItem(
                text: "Institution",
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Home()));
                },
              ),
              NavBarItem(
                text: "Contact",
                onTap: () {
                  Navigator.of(context)
                      .push(new MaterialPageRoute(builder: (BuildContext context) => new AppBarExample()));
                },
              ),
              if (isLogged)
                NavBarItem(
                  text: "My account",
                  onTap: () {
                    Navigator.of(context)
                        .push(new MaterialPageRoute(builder: (BuildContext context) => new AccountPage()));
                  },
                ),
              if (!isLogged)
                NavBarItem(
                  text: "Login",
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Login()));
                  },
                ),
              if (!isLogged)
                NavBarItem(
                  text: "Register",
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Register()));
                  },
                ),
              if (isLogged && isAdmin)
                NavBarItem(
                  text: "Admin Panel",
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new SuperAdmin()));
                  },
                ),
            ],
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(3.0),
                child: Container(
                  height: 3.0,
                  color: burntgold.shade700,
                ))),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background_buildings.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    'Welcome, ' + myUser.getUsername().toString() + '!',
                    style: TextStyle(
                      fontFamily: 'Book Antiqua Font',
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  width: 1000,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
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
                                        onTap: () => Navigator.of(context).push(
                                            new MaterialPageRoute(builder: (BuildContext context) => new ProfilePage())),
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
                                        onTap: () => Navigator.of(context).push(new MaterialPageRoute(
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
                                      child: GestureDetector(
                                        onTap: () => Navigator.of(context).push(
                                            new MaterialPageRoute(builder: (BuildContext context) => new MyDocuments())),
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
                                    ),
                                    GestureDetector(
                                      onTap:(){
                                        isLogged = false;
                                        isAdmin = false;
                                        Navigator.of(context).push(
                                            new MaterialPageRoute(builder: (BuildContext context) => new Login()));
                                      },
                                      child: Container(
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
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ],
        ),
        bottomNavigationBar: const ButtomNavigationBar(),
      ),
    );
  }
}
