import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:flutter/material.dart';
import '../../bottom_navigation_bar.dart';
import '../../colors.dart';
import '../Home/landing.dart';
import '../Institution/institutions/main.dart';
import '../Login/login.dart';
import '../MyAccount/AccountPage.dart';
import '../Register/register.dart';
import '../SuperAdmin/superadmin.dart';
import './body.dart';
void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppBarExample(),
    );
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );
    return Scaffold(
      backgroundColor: Color(0xff293441),
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
      body: Body(),
      
      bottomNavigationBar: ButtomNavigationBar(),
    );
  }
}
