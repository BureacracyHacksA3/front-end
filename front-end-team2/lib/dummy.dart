import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration Demo',
      home: MyRegistrationPage(),
    );
  }
}
class MyRegistrationPage extends StatefulWidget {
  @override
  _MyRegistrationPageState createState() => _MyRegistrationPageState();
}

class _MyRegistrationPageState extends State<MyRegistrationPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  String _feedbackText = '';

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Address',
              ),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: _surnameController,
              decoration: InputDecoration(
                labelText: 'Surname',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                  String backendUrl = "http://127.0.0.1:6969/api/auth/register";
                  final response =
                  await http.post(Uri.parse(backendUrl), body: {
                    'username': _usernameController.text,
                    'password': _passwordController.text,
                    'name': _nameController.text,
                    'surname': _surnameController.text,
                    'email': _emailController.text,
                    'phone_number': _phoneNumberController.text,
                    'city': _addressController.text,
                  });
                  if (response.statusCode == 200) {
                    // Bad request
                    print("user added to db successfully");
                  }
                  else {
                    int statuscode = response.statusCode;
                    print("${response.body} $statuscode");
                  }

                String username = _usernameController.text;
                String password = _passwordController.text;
                String email = _emailController.text;
                String phoneNumber = _phoneNumberController.text;
                String address = _addressController.text;
                String name = _nameController.text;
                String surname = _surnameController.text;

                // perform registration logic here and update feedback text accordingly
                // ...

                setState(() {
                  _feedbackText = 'Registration successful. Welcome, $username!';
                  _usernameController.clear();
                  _passwordController.clear();
                  _emailController.clear();
                  _phoneNumberController.clear();
                  _addressController.clear();
                  _nameController.clear();
                  _surnameController.clear();
                });
              },
              child: Text('Register'),
            ),
            SizedBox(height: 16.0),
            Text(
              _feedbackText,
              style: TextStyle(
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
