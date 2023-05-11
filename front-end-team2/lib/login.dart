import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
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
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Login.borderColor,
                  width: screenWidth < 700 ? 3.0 : 4.0,
                ),
              ),
            ),
            child: TopBar(),
          ),
          Expanded(
            child: Center(
              child: LoginForm(),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: screenWidth < 700 ?  20.0 : 40.0),
            decoration: BoxDecoration(
              color: Login.primaryColor,
              border: Border.all(
                  color: Login
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
        border: Border.all(
            color: Login.borderColor,
            width: screenWidth < 700 ? 3.0 : 4.0
        ),
        borderRadius: BorderRadius.circular(80.0),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Log In',
            style: TextStyle(
                fontSize: screenWidth < 700 ? 25: 35,
                color: Colors.white
            ),
          ),
          SizedBox(height: screenWidth < 700 ? 20.0 : 30.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.email, color: Colors.white, size: screenWidth < 700 ? 15 : 22,),
              SizedBox(width: 5,),
              Text(
                'Email: ',
                style: TextStyle(
                  fontSize: screenWidth < 700 ? 18 : 25,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: screenWidth < 700 ? 5.0 : 10.0,),
          SizedBox(
            height: screenWidth < 700 ? 35 : 45,
            child: TextField(
              cursorColor: Login.borderColor,
              controller: emailController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Login.borderColor,
                        width: screenWidth < 700 ? 2.0 : 3.0
                    ),
                    borderRadius: BorderRadius.circular(15.0)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Login.borderColor,
                        width: screenWidth < 700 ? 2.0 : 3.0
                    ),
                    borderRadius: BorderRadius.circular(15.0)
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Login.borderColor,
                        width: screenWidth < 700 ? 2.0 : 3.0
                    ),
                    borderRadius: BorderRadius.circular(15.0)
                ),
              ),
            ),
          ),
          SizedBox(height: screenWidth < 700 ? 15.0 : 20.0,),
          Row(
            children: [
              Icon(Icons.vpn_key, color: Colors.white, size: screenWidth < 700 ? 15 : 22,),
              SizedBox(width: 5,),
              Text(
                'Parola: ',
                style: TextStyle(
                  fontSize: screenWidth < 700 ?18 : 25,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height:screenWidth < 700 ? 5.0 : 10.0),
          SizedBox(
            height: screenWidth < 700 ? 35 : 45,
            child: TextField(
              obscureText: true,
              controller: passwordController,
              cursorColor: Login.borderColor,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Login.borderColor,
                        width: screenWidth < 700 ? 2.0 : 3.0
                    ),
                    borderRadius: BorderRadius.circular(15.0)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Login.borderColor,
                        width: screenWidth < 700 ?2.0 : 3.0
                    ),
                    borderRadius: BorderRadius.circular(15.0)
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Login.borderColor,
                        width: screenWidth < 700 ? 2.0 : 3.0
                    ),
                    borderRadius: BorderRadius.circular(15.0)
                ),
              ),
            ),
          ),
          SizedBox(height: screenWidth < 700 ? 15.0 : 30.0),
          ElevatedButton(
            onPressed: () {
              //log in press
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Login.borderColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
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
                style: TextStyle(
                    fontSize: screenWidth < 700 ? 15 : 22,
                    color: Colors.white
                ),
              ),
              SizedBox(height: screenWidth < 700 ? 10.0 : 15.0,),
              ElevatedButton(
                onPressed: () {
                  //register press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Login.borderColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  minimumSize: Size(400, screenWidth < 700 ?35 : 45),
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
      backgroundColor: Login.primaryColor,
      toolbarHeight: screenWidth < 700 ? 60.0 : 70.0,
      actions: [
        MouseRegion(
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
                backgroundColor: Login.primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 0.0)
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth < 700 ? 0.0 : 30.0),
              child: Text(
                'Home',
                style: TextStyle(
                    fontSize: screenWidth < 700 ? 13 : 17,
                    color: hovering1 ? Login.borderColor : Colors.white
                ),
              ),
            ),
          ),
        ),
        MouseRegion(
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
                  backgroundColor: Login.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 5.0)
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth < 700 ? 0.0 : 30.0),
                child: Text(
                  'Institutions',
                  style: TextStyle(
                      fontSize: screenWidth < 700 ? 13 : 17,
                      color: hovering2 ? Login.borderColor : Colors.white
                  ),
                ),
              )
          ),
        ),
        MouseRegion(
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
                  backgroundColor: Login.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 5.0)
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth < 700 ? 0.0 : 30.0),
                child: Text(
                  'Contact',
                  style: TextStyle(
                      fontSize: screenWidth < 700 ? 13 : 17,
                      color: hovering3 ? Login.borderColor : Colors.white
                  ),
                ),
              )
          ),
        ),
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
                  backgroundColor: Login.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 0.0)
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth < 700 ? 7.0 : 30.0),

                child: Text(
                  'My Account',
                  style: TextStyle(
                      fontSize: screenWidth < 700 ? 13 : 17,
                      color: hovering4 ? Login.borderColor : Colors.white
                  ),
                ),
              )
          ),
        ),
      ],
    );
  }
}