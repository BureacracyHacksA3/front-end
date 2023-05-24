import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:ipApp/MyAccount/HistoryDocuments.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../colors.dart';
import '../Contact/main.dart';
import '../Home/landing.dart';
import '../Institution/dropdown/buttomNavigationBar.dart';
import '../Institution/institutions/main.dart';
import '../Login/login.dart';
import '../Register/register.dart';
import '../SuperAdmin/superadmin.dart';
import 'AccountPage.dart';

String globalPath = '';

class InspectPdfMobile extends StatefulWidget{
  String path;
  InspectPdfMobile({required this.path});
  String getPath(){return this.path;}
  @override
  State<InspectPdfMobile> createState() => _InspectPdfMobileState();
}

class _InspectPdfMobileState extends State<InspectPdfMobile>{


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            title: 'Setting Account Profile',
            home: Scaffold(
              backgroundColor: Color(0xFF293441),
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
              body: Padding(
                padding: const EdgeInsets.only(top: 30,bottom: 30),
                child: SfPdfViewer.network(
                  widget.getPath(),
                ),
              ),
              bottomNavigationBar: ButtomNavigationBar(),
            ),
    );
  }
}
