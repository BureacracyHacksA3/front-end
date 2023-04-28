import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:ipApp/Mobile/HistoryDocumentsMobile.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

String globalPath = '';

class InspectPdfMobile extends StatefulWidget{
  String path;
  InspectPdfMobile({required this.path});
  String getPath(){return this.path;}
  @override
  State<InspectPdfMobile> createState() => _InspectPdfMobileState();
}

class _InspectPdfMobileState extends State<InspectPdfMobile>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            title: 'Setting Account Profile',
            home: Scaffold(
              backgroundColor: Color(0xFF293441),
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: GestureDetector(
                  onTap: () =>
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new HistoryDocuments())),
                  child: Image.asset(
                    'assets/images/back.png',
                    width: 30,
                  ),
                ),
              ),
              body: SfPdfViewer.network(
                widget.getPath(),
              ),
            ),
    );
  }
}
