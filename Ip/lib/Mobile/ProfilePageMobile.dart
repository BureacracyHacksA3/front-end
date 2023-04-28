import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:ipApp/AccountPage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {

  TextEditingController _nume = TextEditingController();
  TextEditingController _prenume = TextEditingController();
  TextEditingController _numartelefon = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _adresa = TextEditingController();

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
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: GestureDetector(
                  onTap: () =>
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Account())),
                  child: Image.asset(
                    'assets/images/back.png',
                    width: 30,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: 500,
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        'Personal Data',
                        style: TextStyle(
                          fontFamily: 'Louis George Cafe',
                          color: Color(0xFFe5e7e8),
                          fontSize: 35,
                        ),
                      ),
                    ),
                    Container(
                      alignment: AlignmentDirectional.topStart,
                      padding: EdgeInsets.only(top: 20, left: 10),
                      child: Text(
                        'Last Name',
                        style: TextStyle(
                          fontFamily: 'Louis George Cafe',
                          color: Color(0xFFe5e7e8),
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      child: TextField(
                        style: TextStyle(color: Color(0xFFe5e7e8)),
                        controller: _nume,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF101c2b),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                      alignment: AlignmentDirectional.topStart,
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Text(
                        'First Name',
                        style: TextStyle(
                          fontFamily: 'Louis George Cafe',
                          color: Color(0xFFe5e7e8),
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      child: TextField(
                        style: TextStyle(color: Color(0xFFe5e7e8)),
                        controller: _prenume,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF101c2b),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                      alignment: AlignmentDirectional.topStart,
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Text(
                        'Phone Number',
                        style: TextStyle(
                          fontFamily: 'Louis George Cafe',
                          color: Color(0xFFe5e7e8),
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      child: TextField(
                        style: TextStyle(color: Color(0xFFe5e7e8)),
                        controller: _numartelefon,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF101c2b),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                      alignment: AlignmentDirectional.topStart,
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          fontFamily: 'Louis George Cafe',
                          color: Color(0xFFe5e7e8),
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      child: TextField(
                        style: TextStyle(color: Color(0xFFe5e7e8)),
                        controller: _email,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF101c2b),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                      alignment: AlignmentDirectional.topStart,
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Text(
                        'Adress',
                        style: TextStyle(
                          fontFamily: 'Louis George Cafe',
                          color: Color(0xFFe5e7e8),
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      child: TextField(
                        style: TextStyle(color: Color(0xFFe5e7e8)),
                        controller: _adresa,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF101c2b),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: TextButton(
                        onPressed: () {
                          print('NUME: $_nume ');
                          print('PRENUME: $_prenume');
                          print('NUMAR TELEFON: $_numartelefon');
                          print('E-MAIL: $_email');
                          print('ADRESA: $_adresa');
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF896f4e)),
                        ),
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontFamily: 'Louis George Cafe',
                            color: Color(0xFFe5e7e8),
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
