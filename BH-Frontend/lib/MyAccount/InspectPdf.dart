// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../Navigation/bottom_navigation_bar.dart';
import '../Navigation/ontop_navigation_bar.dart';

String globalPath = '';

// ignore: must_be_immutable
class InspectPdf extends StatefulWidget {
  String path;

  InspectPdf({super.key, required this.path});

  String getPath() {
    return path;
  }

  @override
  State<InspectPdf> createState() => _InspectPdfState();
}

class _InspectPdfState extends State<InspectPdf> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Setting Account Profile',
      home: Scaffold(
        backgroundColor: const Color(0xFF293441),
        appBar: const OnTopNavigationBar(),
        body: Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 30),
          child: SfPdfViewer.network(
            widget.getPath(),
          ),
        ),
        bottomNavigationBar: const ButtomNavigationBar(),
      ),
    );
  }
}
