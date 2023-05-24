import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipApp/MyAccount/AccountPage.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import '../../colors.dart';
import '../Contact/main.dart';
import '../Home/landing.dart';
import '../Institution/dropdown/buttomNavigationBar.dart';
import '../Institution/institutions/main.dart';
import '../Login/login.dart';
import '../Register/register.dart';
import '../SuperAdmin/superadmin.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  final TextEditingController phoneChange = new TextEditingController();
  final TextEditingController emailChange = new TextEditingController();
  final String message = '';

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
        appBar:AdaptiveNavBar(
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Center(
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
                  Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 20),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Last Name',
                            style: TextStyle(
                              fontFamily: 'Louis George Cafe',
                              color: Color(0xFFe5e7e8),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            myUser.name.toString(),
                            style: TextStyle(
                              fontFamily: 'Louis George Cafe',
                              color: Color(0xFFe5e7e8),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'First Name',
                            style: TextStyle(
                              fontFamily: 'Louis George Cafe',
                              color: Color(0xFFe5e7e8),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            myUser.getSurName().toString(),
                            style: TextStyle(
                              fontFamily: 'Louis George Cafe',
                              color: Color(0xFFe5e7e8),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Phone Number',
                            style: TextStyle(
                              fontFamily: 'Louis George Cafe',
                              color: Color(0xFFe5e7e8),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            myUser.getPhone().toString(),
                            style: TextStyle(
                              fontFamily: 'Louis George Cafe',
                              color: Color(0xFFe5e7e8),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Email',
                            style: TextStyle(
                              fontFamily: 'Louis George Cafe',
                              color: Color(0xFFe5e7e8),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            myUser.getEmail().toString(),
                            style: TextStyle(
                              fontFamily: 'Louis George Cafe',
                              color: Color(0xFFe5e7e8),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Adress',
                            style: TextStyle(
                              fontFamily: 'Louis George Cafe',
                              color: Color(0xFFe5e7e8),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            myUser.getCity().toString(),
                            style: TextStyle(
                              fontFamily: 'Louis George Cafe',
                              color: Color(0xFFe5e7e8),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Modify My Phone Number',
                            style: TextStyle(
                              fontFamily: 'Louis George Cafe',
                              color: Color(0xFFe5e7e8),
                              fontSize: 20,
                            ),
                          ),
                          TextField(
                            controller: phoneChange,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Modify My Email',
                            style: TextStyle(
                              fontFamily: 'Louis George Cafe',
                              color: Color(0xFFe5e7e8),
                              fontSize: 20,
                            ),
                          ),
                          TextField(
                            controller: emailChange,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      String newPhone = phoneChange.value.text;
                      String newEmail = emailChange.value.text;
                      final String backendUrl = "http://127.0.0.1:6969/api/user-service/update";
                      final Uri uri = Uri.parse(backendUrl);

                      if (newPhone != null) {
                        myUser.setPhone(newPhone);
                      }
                      if (newEmail != null) {
                        myUser.setEmail(newEmail);
                      }

                      if (newEmail == null && newPhone == null) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('No field has been modified!'),
                              content: Text(''),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).push(
                                        new MaterialPageRoute(builder: (BuildContext context) => new AccountPage()));
                                    // Close dialog
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }

                      final Map<String, dynamic> body = {
                        'username': myUser.getUsername().toString(),
                        'email': myUser.getEmail().toString(),
                        'phone_number': myUser.getPhone().toString(),
                        'name': myUser.getName().toString(),
                        'surname': myUser.getSurName().toString(),
                        'city': myUser.getCity().toString(),
                      };

                      try {
                        final token = myUser.getToken();
                        final response = await http.post(uri, body: body, headers: {'Authorization': 'Bearer $token'});
                        if (response.statusCode == 200) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Modify succesfully!'),
                                content: Text(''),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).push(
                                          new MaterialPageRoute(builder: (BuildContext context) => new AccountPage()));
                                      // Close dialog
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      } catch (e) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('No modify succesfully!'),
                              content: Text(''),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).push(
                                        new MaterialPageRoute(builder: (BuildContext context) => new AccountPage()));
                                    // Close dialog
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Text(
                      'Submit',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: ButtomNavigationBar(),
      ),
    );
  }
}
