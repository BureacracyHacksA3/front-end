import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipApp/MyAccount/InspectPdf.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:ipApp/MyAccount/AccountPage.dart';
import 'package:ipApp/MyAccount/InspectPdf.dart';

import '../../colors.dart';
import '../Contact/main.dart';
import '../Home/landing.dart';
import '../Institution/dropdown/buttomNavigationBar.dart';
import '../Institution/institutions/main.dart';
import '../Login/login.dart';
import '../Register/register.dart';
import '../SuperAdmin/superadmin.dart';

class HistoryDocuments extends StatefulWidget {
  const HistoryDocuments({Key? key}) : super(key: key);

  @override
  State<HistoryDocuments> createState() => _HistoryDocumentsState();
}

class Document {
  String? status;
  int? idInstitution;
  int? idDocument;
  String? name;
  String? path;

  Document({this.status, this.idInstitution, this.idDocument, this.name, this.path});

  String? getStatus() {
    return status;
  }

  int? getIdInstitution() {
    return idInstitution;
  }

  int? getIdDocument() {
    return idDocument;
  }

  String? getName() {
    return name;
  }

  String? getPath() {
    return path;
  }
}

class _HistoryDocumentsState extends State<HistoryDocuments> {
  final List<dynamic> data = [
    {
      "headers": {},
      "body": {
        "document_id": 1231,
        "name": "Bilant Guvernare",
        "description": "-",
        "price": 2.0,
        "institution_id": 682,
        "path":
            "https://gov.ro/fisiere/programe_fisiere/26-05_Guvernul_Nicolae-Ionel_Ciuca_-_Bilant_la_6_luni_de_guvernare.pdf"
      },
      "statusCode": "DONE",
      "statusCodeValue": 200,
    },
    {
      "headers": {},
      "body": {
        "document_id": 834,
        "name": "Raport Strategie",
        "description": "-",
        "price": 2.0,
        "institution_id": 89,
        "path": "https://gov.ro/fisiere/programe_fisiere/Raport_final_strategie_mai_2022.pdf"
      },
      "statusCode": "DONE",
      "statusCodeValue": 200,
    },
    {
      "headers": {},
      "body": {
        "document_id": 951,
        "name": "Program Guvernare",
        "description": "-",
        "price": 2.0,
        "institution_id": 151,
        "path": "https://gov.ro/fisiere/programe_fisiere/Program_de_Guvernare_2021%E2%80%942024.pdf"
      },
      "statusCode": "IN PROGRESS",
      "statusCodeValue": 200,
    }
  ];
  List<Document> documents = [];

  @override
  void initState() {
    super.initState();
    getInformations();
  }

  Future<void> getInformations() async {
    for (int i = 0; i < data.length; ++i) {
      Map<String, dynamic> item = data[i] as Map<String, dynamic>;
      Map<String, dynamic> documentInfo = item['body'] as Map<String, dynamic>;
      String? status = item['statusCode'] as String?;
      Document doc = new Document(
          status: status,
          idInstitution: documentInfo['institution_id'],
          idDocument: documentInfo['document_id'],
          name: documentInfo['name'],
          path: documentInfo['path']);
      documents.add(doc);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Documents',
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
          padding: const EdgeInsets.only(top: 30, bottom: 30),
          child: Column(
            children: <Widget>[
              Container(
                height: 40,
                width: 500,
                alignment: AlignmentDirectional.center,
                child: Text(
                  'Your Documents',
                  style: TextStyle(
                    fontFamily: 'Louis George Cafe',
                    color: Color(0xFFe5e7e8),
                    fontSize: 35,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 8.0, left: 8.0),
                child: Container(
                  height: 500,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      for (int i = 0; i < data.length; ++i)
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Opacity(
                            opacity: 0.8,
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                color: Color(0xFF101c2b),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 35),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: Column(
                                        children: <Widget>[
                                          if (documents[i].getStatus().toString() == 'DONE')
                                            Text(
                                              'Status: ' + documents[i].getStatus().toString(),
                                              style: TextStyle(
                                                fontFamily: 'Louis George Cafe',
                                                color: Colors.green,
                                                fontSize: 15,
                                              ),
                                            ),
                                          if (documents[i].getStatus().toString() == 'IN PROGRESS')
                                            Text(
                                              'Status: ' + documents[i].getStatus().toString(),
                                              style: TextStyle(
                                                fontFamily: 'Louis George Cafe',
                                                color: Colors.yellow,
                                                fontSize: 15,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      'Institution Id: ' + documents[i].getIdInstitution().toString(),
                                      style: TextStyle(
                                        fontFamily: 'Louis George Cafe',
                                        color: Color(0xFFe5e7e8),
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      'Document Id: ' + documents[i].getIdDocument().toString(),
                                      style: TextStyle(
                                        fontFamily: 'Louis George Cafe',
                                        color: Color(0xFFe5e7e8),
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      'Document Name: ' + documents[i].getName().toString(),
                                      style: TextStyle(
                                        fontFamily: 'Louis George Cafe',
                                        color: Color(0xFFe5e7e8),
                                        fontSize: 20,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 10),
                                      child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            Navigator.of(context).push(new MaterialPageRoute(
                                                builder: (BuildContext context) =>
                                                    InspectPdfMobile(path: documents[i].getPath().toString())));
                                          });
                                        },
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF896f4e)),
                                        ),
                                        child: Text(
                                          'Inspect Document',
                                          style: TextStyle(
                                            fontFamily: 'Louis George Cafe',
                                            color: Color(0xFFe5e7e8),
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
        bottomNavigationBar: ButtomNavigationBar(),
      ),
    );
  }
}
