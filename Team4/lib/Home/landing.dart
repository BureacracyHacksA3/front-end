import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:ipApp/Institution/dropdown/main.dart';

import '../../bottom_navigation_bar.dart';
import '../../colors.dart';
import '../Contact/main.dart';
import '../Institution/institutions/main.dart';
import '../Login/login.dart';
import '../MyAccount/AccountPage.dart';
import '../Register/register.dart';
import '../SuperAdmin/superadmin.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'InriaSerif',
      ),
      home: Scaffold(
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
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new MyApp()));
                },
              ),
              NavBarItem(
                text: "Institution",
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Home()));
                },
              ),
              NavBarItem(
                text: "Contact",
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new AppBarExample()));
                },
              ),
              if (isLogged)
                NavBarItem(
                  text: "My account",
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new AccountPage()));
                  },
                ),
              if (!isLogged)
                NavBarItem(
                  text: "Login",
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new Login()));
                  },
                ),
              if (!isLogged)
                NavBarItem(
                  text: "Register",
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new Register()));
                  },
                ),
              if (isLogged && isAdmin)
                NavBarItem(
                  text: "Admin Panel",
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new SuperAdmin()));
                  },
                ),
              if (isLogged && isAdmin)
                NavBarItem(
                  text: "DocPanel",
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new DocPage()));
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
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1,
                    color: Color(0xFF896F4E),
                  ),
                  bottom: BorderSide(
                    width: 1,
                    color: Color(0xFF896F4E),
                  ),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/background_buildings.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 50.0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      width: 500.0,
                      height: 300.0,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(73, 0, 0, 0),
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                      ),
                      child: const Center(
                        child: Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'InriaSerif'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
        bottomNavigationBar: const ButtomNavigationBar(),
      ),
    );
  }
}

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  bool _isMobile = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 768) {
      _isMobile = true;
    } else {
      _isMobile = false;
    }

    return Container(
      color: const Color(0XFF101C2B),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset('assets/images/logoip.png', fit: BoxFit.fill),
            ),
            _isMobile
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            Scaffold.of(context).openDrawer();
                          });
                        },
                      ),
                    ],
                  )
                : Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextButton(
                            onPressed: () {}, //link catre
                            child: const Text(
                              'Home',
                              style: TextStyle(
                                  color: Color(0xFF896F4E), fontSize: 18.0),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextButton(
                            onPressed: () {}, //link catre
                            child: const Text(
                              'Institutions',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextButton(
                            onPressed: () {}, //link catre
                            child: const Text(
                              'Contact',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: SizedBox(
                                width: 150.0,
                                child: TextButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color(0xFF896F4E))),
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18.0),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: SizedBox(
                                width: 150.0,
                                child: TextButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color(0xFF896F4E))),
                                  child: const Text(
                                    'Register',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18.0),
                                  ),
                                ),
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
