import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipApp/Mobile/AccountPageMobile.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:ipApp/Desktop/AccountPageDesktop.dart';

void main(){
  runApp(Account());
}

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _Account(),
    );
  }
}

class _Account extends StatefulWidget {
  const _Account({Key? key}) : super(key: key);

  @override
  State<_Account> createState() => _AccountState();
}

class _AccountState extends State<_Account> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => AccountPageMobile(),
      desktop: (BuildContext context) => AccountPageDesktop(),
    );
  }
}

