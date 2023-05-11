import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/home.dart';
import '/myAccount.dart';
import '/institutions.dart';
import '/contact.dart';

void main() {
  runApp(MaterialApp(
    home: SuperAdminPage(),
    routes:{
      '/admin.dart': (context) => SuperAdminPage(),
      '/home.dart': (context) => Home(),
      '/myAccount.dart': (context) => MyAccount(),
      '/institutions.dart': (context) => Institutions(),
      '/contact.dart': (context) => Contact(),
    },
  ));
}
class SuperAdminPage extends StatefulWidget {
  const SuperAdminPage({Key? key}) : super(key: key);
  static const primaryColor = const Color(0xff101C2B);
  static const borderColor = const Color(0xff896F4E);
  static const bgColor = const Color(0xff293441);
  @override
  State<SuperAdminPage> createState() => _SuperAdminPageState();
}

class _SuperAdminPageState extends State<SuperAdminPage> {

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: SuperAdminPage.bgColor,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: SuperAdminPage.borderColor,
                  width: screenWidth < 700 ? 3.0 : 4.0,
                ),
              ),
            ),
            child: TopBar(),
          ),
          Expanded(
            child: Center(
              child: SuperAdmin(),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: screenWidth < 700 ?  20.0 : 40.0),
            decoration: BoxDecoration(
              color: SuperAdminPage.primaryColor,
              border: Border.all(
                  color: SuperAdminPage
                      .borderColor,
                  width: screenWidth < 700 ? 2.0 : 3.0
              ),
            ),
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Email: groupA3@gmail.com',
                  style: TextStyle(
                      fontSize: screenWidth < 700 ? 12 : 15,
                      color: Colors.white
                  ),
                ),
                Text(
                  'Phone: 0710293847',
                  style: TextStyle(
                      fontSize: screenWidth < 700 ? 12 : 15,
                      color: Colors.white
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SuperAdmin extends StatefulWidget {
  const SuperAdmin({Key? key}) : super(key: key);

  @override
  State<SuperAdmin> createState() => _SuperAdminState();
}

class _SuperAdminState extends State<SuperAdmin> {
  final TextEditingController _accController = TextEditingController();
  final List<String> _accounts = [];
  final _focusNode = FocusNode();

  @override
  void dispose(){
    _accController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenWidth < 700 ? 420.0 : 550.0,
      width: screenWidth < 700 ? 370.0 : 700.0,
      padding: EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: SuperAdminPage.primaryColor,
        border: Border.all(
            color: SuperAdminPage.borderColor,
            width: screenWidth < 700 ? 3.0 : 4.0
        ),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.supervisor_account, color: Colors.white, size: screenWidth < 700 ? 24 : 27,),
                SizedBox(width: 10,),
                Text(
                  'Admin list',
                  style: TextStyle(
                      fontSize: screenWidth < 700 ? 22 : 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenWidth < 700 ? 15.0 : 25.0),
          TextField(
            focusNode: _focusNode,
            onSubmitted: (value){
              if(value.isNotEmpty)
                setState(() {
                  _accounts.add(_accController.text);
                  _accController.clear();
                });
              _focusNode.requestFocus();
            },
            controller: _accController,
            cursorColor: SuperAdminPage.borderColor,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person, color: Colors.white, size: screenWidth < 700 ? 24 : 27,),
              fillColor: Colors.white,
              hintText: 'Enter username',
              hintStyle: TextStyle(color: Colors.white10,
                  fontSize: screenWidth < 700 ? 15.0 : 18.0),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: SuperAdminPage.borderColor,
                      width: screenWidth < 700 ? 2.0 : 3.0
                  ),
                  borderRadius: BorderRadius.circular(15.0)
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: SuperAdminPage.borderColor,
                      width: screenWidth < 700 ? 2.0 : 3.0
                  ),
                  borderRadius: BorderRadius.circular(15.0)
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: SuperAdminPage.borderColor,
                      width: screenWidth < 700 ? 2.0 : 3.0
                  ),
                  borderRadius: BorderRadius.circular(15.0)
              ),
            ),
          ),
          SizedBox(height: screenWidth < 700 ? 15.0 : 25.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: SuperAdminPage.borderColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              minimumSize: Size(screenWidth < 700 ? 150 : 200, screenWidth < 700 ? 35 : 45),
            ),
            onPressed: () async {
              String backendUrl = 'http://127.0.0.1:6969/api/auth/SuperAdmin';
              String acc = _accController.text.trim();
              final response = await http.post(Uri.parse(backendUrl),
                  body:{
                'username': _accController.text,
                  }
              );
              if(acc.isNotEmpty)
                setState(() {
                  _accounts.add(_accController.text);
                  _accController.clear();
                });
              _focusNode.requestFocus();
            },
            child: Text('Make admin',
              style: TextStyle(
                  fontSize: screenWidth < 700 ? 15 : 18
              ),),
          ),
          SizedBox(height: screenWidth < 700 ? 15.0 : 25.0),
          Expanded(
            child: ListView.builder(
              itemCount: _accounts.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: SuperAdminPage.borderColor),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.close,
                          color: Colors.red,),
                        onPressed: () {
                          setState(() {
                            _accounts.removeAt(index);
                          });
                        },
                      ),
                      SizedBox(width: screenWidth < 700 ? 15.0 : 25.0),
                      Expanded(
                        child: Row(
                          children: [
                            Icon(Icons.person, color: Colors.white, size: screenWidth < 700 ? 24 : 27,),
                            SizedBox(width: 10),
                            Text(_accounts[index],
                              style: TextStyle(
                                  fontSize: screenWidth < 700 ? 15 : 18,
                                  color: Colors.white
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


class TopBar extends StatefulWidget implements PreferredSizeWidget{
  const TopBar({Key? key}) : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();

  @override
  Size get preferredSize => throw UnimplementedError();
}

class _TopBarState extends State<TopBar> {
  @override
  Size get preferredSize => const Size.fromHeight(60);

  bool hovering1 = false;
  bool hovering2 = false;
  bool hovering3 = false;
  bool hovering4 = false;

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    return AppBar(
      title: Row(
        children: [
          Image.asset('images/logo-ip.png', height: screenWidth < 700 ? 40.0 : 60.0),
        ],
      ),
      backgroundColor: SuperAdminPage.primaryColor,
      toolbarHeight: screenWidth < 700 ? 60.0 : 70.0,
      actions: [
        GestureDetector(
    onTap: () {//home button press
      Navigator.pushNamed(context, '/home');},
       child: MouseRegion(
          onHover: (PointerEvent details){
            setState(() {
              hovering1 = true;
            });
          },
          onExit: (PointerEvent details){
            setState(() {
              hovering1 = false;
            });
          },
          child: ElevatedButton(
            onPressed: () {
              //home button press
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: SuperAdminPage.primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 0.0)
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth < 700 ? 0.0 : 30.0),
              child: Text(
                'Home',
                style: TextStyle(
                    fontSize: screenWidth < 700 ? 13 : 17,
                    color: hovering1 ? SuperAdminPage.borderColor : Colors.white
                ),
              ),
            ),
          ),
        ),
    ),

    GestureDetector(
    onTap: () {//institutions button press
      Navigator.pushNamed(context, '/institutions.dart');},
     child: MouseRegion(
          onHover: (PointerEvent details){
            setState(() {
              hovering2 = true;
            });
          },
          onExit: (PointerEvent details){
            setState(() {
              hovering2 = false;
            });
          },
          child: ElevatedButton(
              onPressed: () {
                //institution button press
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: SuperAdminPage.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 5.0)
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth < 700 ? 0.0 : 30.0),
                child: Text(
                  'Institutions',
                  style: TextStyle(
                      fontSize: screenWidth < 700 ? 13 : 17,
                      color: hovering2 ? SuperAdminPage.borderColor : Colors.white
                  ),
                ),
              )
          ),
        ),
    ),
    GestureDetector(
    onTap: () {//contact button press
      Navigator.pushNamed(context, '/contact.dart');},
       child : MouseRegion(
          onHover: (PointerEvent details){
            setState(() {
              hovering3 = true;
            });
          },
          onExit: (PointerEvent details){
            setState(() {
              hovering3 = false;
            });
          },
          child: ElevatedButton(
              onPressed: () {
                //contact button press
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: SuperAdminPage.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 5.0)
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth < 700 ? 0.0 : 30.0),
                child: Text(
                  'Contact',
                  style: TextStyle(
                      fontSize: screenWidth < 700 ? 13 : 17,
                      color: hovering3 ? SuperAdminPage.borderColor : Colors.white
                  ),
                ),
              )
          ),
        ),
    ),
    GestureDetector(
    onTap: () {//My Account button press
      Navigator.pushNamed(context, '/myAccount.dart');},
      child:
        MouseRegion(
          onHover: (PointerEvent details){
            setState(() {
              hovering4 = true;
            });
          },
          onExit: (PointerEvent details){
            setState(() {
              hovering4 = false;
            });
          },
          child: ElevatedButton(
              onPressed: () {
                //My Account button press
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: SuperAdminPage.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 0.0)
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth < 700 ? 7.0 : 30.0),

                child: Text(
                  'My Account',
                  style: TextStyle(
                      fontSize: screenWidth < 700 ? 13 : 17,
                      color: hovering4 ? SuperAdminPage.borderColor : Colors.white
                  ),
                ),
              )
          ),
        ),
    ),
      ],
    );
  }
}