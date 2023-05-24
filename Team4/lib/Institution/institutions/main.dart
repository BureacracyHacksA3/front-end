import 'package:flutter/material.dart';
import 'package:ipApp/Login/login.dart';
import 'package:ipApp/MyAccount/AccountPage.dart';
import 'package:ipApp/Register/register.dart';
import '../../../colors.dart';
import '../../Home/landing.dart';
import '../../MyAccount/ProfilePage.dart';
import '../../SuperAdmin/superadmin.dart';
import './body.dart';
import 'package:ipApp/bottom_navigation_bar.dart';
import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:ipApp/Contact/main.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );
    return Scaffold(
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
      body: SingleChildScrollView(child: 
        Body(),
        
      ),
      
      bottomNavigationBar: const ButtomNavigationBar(),
    );
  }
}