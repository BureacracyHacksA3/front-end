import 'dart:io';
import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ipApp/MyAccount/AccountPage.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ipApp/MyAccount/AccountPage.dart';

import '../../colors.dart';
import '../Contact/main.dart';
import '../Home/landing.dart';
import '../Institution/dropdown/buttomNavigationBar.dart';
import '../Institution/institutions/main.dart';
import '../Login/login.dart';
import '../Register/register.dart';
import '../SuperAdmin/superadmin.dart';

class MyDocuments extends StatefulWidget {
  const MyDocuments({Key? key}) : super(key: key);

  @override
  State<MyDocuments> createState() => _MyDocumentsState();
}

class Photo{
  late File image;
  late String name;

  Photo(File file, String desc){
    this.image = file;
    this.name = desc;
  }

  void setImage(File image){
    this.image = image;
  }
  void setName(String name){
    this.name = name;
  }
  File getImage(){
    return this.image;
  }
  String getName(){
    return this.name;
  }
}

class _MyDocumentsState extends State<MyDocuments> {

  List<Photo> images = [];
  TextEditingController _text = new TextEditingController();

  @override
  void initState(){
    super.initState();
  }

  Future<void> _takeImage(String desc) async{
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        images.add(new Photo(File(pickedFile.path),desc));
      });
    }
  }

  Future<void> _updateImages() async{
    images.last.setName(_text.toString());
  }

  Future<void> _deleteImages() async{
    images.last.setName(_text.toString());
    _text.clear();
    for(int i = 0; i < images.length; ++i){
      print(images[i].getImage());
      print(images[i].getName());
    }
    setState(() {
      images.clear();
    });
  }

  _displayDialog(BuildContext context){
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Name of document'),
            content: TextField(
              controller: _text,
              decoration: InputDecoration(hintText: "Put a name"),
            ),
            actions: <Widget>[
              TextButton(
                child: new Text('SUBMIT'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
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
        body:  Padding(
          padding: const EdgeInsets.only(top: 30,bottom: 30),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 40,
                  width: 500,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    'Personal Documents',
                    style: TextStyle(
                      fontFamily: 'Louis George Cafe',
                      color: Color(0xFFe5e7e8),
                      fontSize: 35,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      FloatingActionButton(
                        backgroundColor: Color(0xFF101c2b),
                        onPressed:(){
                          _displayDialog(context);
                          _takeImage(_text.toString());
                          images.last.setName(_text.toString());
                        },
                        child: Icon(
                          Icons.add,
                          color: Color(0xFFe5e7e8),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Add your personal photos',
                          style: TextStyle(
                            fontFamily: 'Louis George Cafe',
                            color: Color(0xFFe5e7e8),
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      FloatingActionButton(
                        backgroundColor: Color(0xFF101c2b),
                        onPressed: _deleteImages,
                        child: Icon(
                          Icons.remove,
                          color: Color(0xFFe5e7e8),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Delete your personal photos',
                          style: TextStyle(
                            fontFamily: 'Louis George Cafe',
                            color: Color(0xFFe5e7e8),
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top:50,right: 8.0,left: 8.0),
                  child: Container(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: images.length,
                      itemBuilder: (context,index){
                        return Image.file(images[index].getImage());
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: ButtomNavigationBar(),
      ),
    );
  }
}


