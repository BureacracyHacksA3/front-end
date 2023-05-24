import 'dart:convert';
import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:ipApp/Register/register.dart';
import 'package:ipApp/SuperAdmin/superadmin.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../Contact/main.dart';
import '../Home/landing.dart';
import '../Institution/dropdown/buttomNavigationBar.dart';
import '../Institution/institutions/main.dart';
import '../MyAccount/AccountPage.dart';
import '../colors.dart';

void main() {
  runApp(MaterialApp(
    // Register the route generator for the "/register.dart" route
    onGenerateRoute: (settings) {
      if (settings.name == '/register.dart') {
        return MaterialPageRoute(builder: (context) => Register());
      }
      return null;
    },
    home: Login(),
  ));
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const primaryColor = const Color(0xff101C2B);
  static const borderColor = const Color(0xff896F4E);
  static const bgColor = const Color(0xff293441);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Login.bgColor,
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
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: LoginForm(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ButtomNavigationBar(),
    );
  }
}

class User {
  String token;
  String name;
  String surname;
  String username;
  String email;
  String password;
  String phone_number;
  String created_at;
  String city;
  String roles;

  User(
      {required this.roles, required this.token,
      required this.name,
      required this.surname,
      required this.username,
      required this.email,
      required this.password,
      required this.phone_number,
      required this.created_at,
      required this.city});

  String getUsername() {
    return this.username;
  }

  String getName() {
    return this.name;
  }

  String getSurName() {
    return this.surname;
  }

  String getEmail() {
    return this.email;
  }

  String getPhone() {
    return this.phone_number;
  }

  String getCity() {
    return this.city;
  }

  String getPassword() {
    return this.password;
  }

  String getToken() {
    return this.token;
  }

  String getRoles(){
    return this.roles;
  }

  void setEmail(String email) {
    this.email = email;
  }

  void setPhone(String phone) {
    this.phone_number = phone;
  }

  void setToken(String token){
    this.token = token;
  }

  void setRole(String roles){
    this.roles = roles;
  }
}

late User myUser;
bool isLogged = false;
bool isAdmin = false;

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Container(
      height: screenWidth < 700 ? 420.0 : 550.0,
      width: screenWidth < 700 ? 320.0 : 450.0,
      padding: EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Login.primaryColor,
        border: Border.all(color: Login.borderColor, width: screenWidth < 700 ? 3.0 : 4.0),
        borderRadius: BorderRadius.circular(80.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Log In',
            style: TextStyle(fontSize: screenWidth < 700 ? 25 : 35, color: Colors.white),
          ),
          SizedBox(
            height: screenWidth < 700 ? 20.0 : 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.email,
                color: Colors.white,
                size: screenWidth < 700 ? 15 : 22,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Email: ',
                style: TextStyle(
                  fontSize: screenWidth < 700 ? 18 : 25,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: screenWidth < 700 ? 5.0 : 10.0,
          ),
          SizedBox(
            height: screenWidth < 700 ? 35 : 45,
            child: TextField(
              cursorColor: Login.borderColor,
              controller: emailController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Login.borderColor, width: screenWidth < 700 ? 2.0 : 3.0),
                    borderRadius: BorderRadius.circular(15.0)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Login.borderColor, width: screenWidth < 700 ? 2.0 : 3.0),
                    borderRadius: BorderRadius.circular(15.0)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Login.borderColor, width: screenWidth < 700 ? 2.0 : 3.0),
                    borderRadius: BorderRadius.circular(15.0)),
              ),
            ),
          ),
          SizedBox(
            height: screenWidth < 700 ? 15.0 : 20.0,
          ),
          Row(
            children: [
              Icon(
                Icons.vpn_key,
                color: Colors.white,
                size: screenWidth < 700 ? 15 : 22,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Parola: ',
                style: TextStyle(
                  fontSize: screenWidth < 700 ? 18 : 25,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: screenWidth < 700 ? 5.0 : 10.0),
          SizedBox(
            height: screenWidth < 700 ? 35 : 45,
            child: TextField(
              obscureText: true,
              controller: passwordController,
              cursorColor: Login.borderColor,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Login.borderColor, width: screenWidth < 700 ? 2.0 : 3.0),
                    borderRadius: BorderRadius.circular(15.0)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Login.borderColor, width: screenWidth < 700 ? 2.0 : 3.0),
                    borderRadius: BorderRadius.circular(15.0)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Login.borderColor, width: screenWidth < 700 ? 2.0 : 3.0),
                    borderRadius: BorderRadius.circular(15.0)),
              ),
            ),
          ),
          SizedBox(height: screenWidth < 700 ? 15.0 : 30.0),
          ElevatedButton(
            onPressed: () async {
              final String backendUrl = "http://127.0.0.1:6969/api/auth/login";
              final Uri uri = Uri.parse(backendUrl);
              final Map<String, dynamic> body = {
                'usernameOrEmail': emailController.text,
                'password': passwordController.text,
              };

              try {
                final response = await http.post(uri, body: body);
                if (response.statusCode == 200) {
                  // Successful authentication
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Authenticated user'),
                        content: Text(''),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              // Handle the response data here
                              final responseData = json.decode(response.body);
                              final user = responseData['user'];
                              // Example: Retrieve the token and user data
                              final token = responseData['token'].toString();
                              final name = user['name'].toString();
                              final username = user['username'].toString();
                              final surname = user['surname'].toString();
                              final email = user['email'].toString();
                              final password = user['password'].toString();
                              final phone_number = user['phone_number'].toString();
                              final city = user['city'].toString();
                              final created_at = user['created_at'].toString();
                              final role = user['roles'].toString();
                              String roleString = role;
                              late int index;
                              for(int i = 0; i < roleString.length; ++i){
                                if(roleString[i] == 'n'){
                                  index = i + 6;
                                  break;
                                }
                              }
                              String nameRole = '';
                              for(int i = index; i < roleString.length; ++i){
                                if(roleString[i] == ',')
                                  break;
                                nameRole += roleString[i];
                              }

                              isLogged = true;
                              myUser = new User(
                                  roles: nameRole,
                                  token: token,
                                  name: name,
                                  surname: surname,
                                  username: username,
                                  email: email,
                                  password: password,
                                  phone_number: phone_number,
                                  created_at: created_at,
                                  city: city);

                              if(myUser.getRoles() == 'ROLE_ADMIN')
                                isAdmin = true;
                              Navigator.of(context).pop();
                              Navigator.of(context)
                                  .push(new MaterialPageRoute(builder: (BuildContext context) => new AccountPage()));
                               // Close dialog
                            },
                          ),
                        ],
                      );
                    },
                  );
                  // Perform further actions with the token and user data
                } else {
                  // Authentication failed
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Failed to authenticate user'),
                        content: Text(''),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop(); // Close dialog
                            },
                          ),
                        ],
                      );
                    },
                  );
                  // Handle the failed authentication here
                }
              } catch (e) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Can not authenticate user'),
                      content: Text(''),
                      actions: <Widget>[
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop(); // Close dialog
                          },
                        ),
                      ],
                    );
                  },
                );
                // Handle any network or other errors here
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Login.borderColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              minimumSize: Size(400, screenWidth < 700 ? 35 : 45),
            ),
            child: Text(
              'Log in',
              style: TextStyle(fontSize: screenWidth < 700 ? 18 : 20),
            ),
          ),
          SizedBox(height: screenWidth < 700 ? 15.0 : 20.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '''Sau inregistreaza-te daca nu 
              ai inca un cont:''',
                style: TextStyle(fontSize: screenWidth < 700 ? 15 : 22, color: Colors.white),
              ),
              SizedBox(
                height: screenWidth < 700 ? 10.0 : 15.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register.dart');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Login.borderColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  minimumSize: Size(400, screenWidth < 700 ? 35 : 45),
                ),
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: screenWidth < 700 ? 18 : 20),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
      ),
      body: Center(
        child: Text('Register Page'),
      ),
    );
  }
}
