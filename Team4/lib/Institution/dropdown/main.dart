import 'package:ipApp/ToDo/main.dart';

import '../../Contact/main.dart';
import '../../Login/login.dart';
import '../../MyAccount/AccountPage.dart';
import '../../Register/register.dart';
import '../../SuperAdmin/superadmin.dart';
import '../../colors.dart';
import '../institutions/main.dart';
import './models/document.dart';
import 'services/task_service.dart';
import 'services/documents_service.dart';
import 'package:flutter/material.dart';
import './buttomNavigationBar.dart';
import 'package:adaptive_navbar/adaptive_navbar.dart';

void main() {
  runApp(const DocPage());
}

class DocPage extends StatelessWidget {
  const DocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _selectedOption;
  final TasksService _tasksService = TasksService();
  late List<String> _options = [];

  @override
  void initState() {
    super.initState();
    _loadTasksNames();
  }

  Future<void> _loadTasksNames() async {
    final tasksNames = await _tasksService.getTasksNames();
    setState(() {
      _options = tasksNames;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
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
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new DocPage()));
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
          ],
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(3.0),
              child: Container(
                height: 3.0,
                color: burntgold.shade700,
              ))),
      body: Center(
          child: Container(
        //toata pagina
        color: const Color(0xff293441),
        child: Center(
          child: Container(
            //width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: const Color(0xff293441),
            ),
            //width: 350, // setați lățimea dorită
            //height: 400, // setați înălțimea dorită
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: DropdownButtonFormField(
                    isExpanded: true,
                    //icon: Container(width: 0, height: 0),
                    dropdownColor: const Color(0xff896F4E),
                    decoration: InputDecoration(
                      //contentPadding: const EdgeInsets.symmetric(
                      //   horizontal: 16.0, vertical: 8.0),
                      filled: true,
                      fillColor: const Color(0xff896F4E),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide.none,
                      ),
                      hintStyle: const TextStyle(color: Colors.white),
                      hintText: 'Selecteaza document',
                    ),
                    value: _selectedOption,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedOption = newValue.toString();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MyOtherPage(selectedOption: _selectedOption!),
                          ),
                        );
                      });
                    },
                    items: _options.map((option) {
                      return DropdownMenuItem(
                        value: option,
                        child: Text(
                          option,
                          style: const TextStyle(
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
      bottomNavigationBar: const ButtomNavigationBar(),
    );
  }
}

class MyOtherPage extends StatefulWidget {
  final String selectedOption;

  //const MyOtherPage({Key? key}) : super(key: key);
  const MyOtherPage({Key? key, required this.selectedOption}) : super(key: key);

  @override
  _MyOtherPageState createState() => _MyOtherPageState();
}

class _MyOtherPageState extends State<MyOtherPage> {
  final DocumentApi _documentApi = DocumentApi();
  late List<Document>? _documents = [];

  @override
  void initState() {
    super.initState();
    _loadDocuments();
  }

  Future<void> _loadDocuments() async {
    final documents = await _documentApi.getDocuments(widget.selectedOption);
    setState(() {
      _documents = documents;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    bool isButtonVisible = false;

    return Scaffold(
      backgroundColor: const Color(0xff293441),
      appBar: AdaptiveNavBar(
        screenWidth: sw,
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
              Navigator.pushNamed(context, "routeName");
            },
          ),
          NavBarItem(
            text: "Institution",
            onTap: () {
              Navigator.pushNamed(context, "routeName");
            },
          ),
          NavBarItem(
            text: "Contact",
            onTap: () {
              Navigator.pushNamed(context, "routeName");
            },
          ),
          NavBarItem(
            text: "My account",
            onTap: () {
              Navigator.pushNamed(context, "routeName");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            height: 1200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Acte necesare pentru eliberare ${widget.selectedOption}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: "Inria Serif",
                        fontSize: 30,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: const Color.fromARGB(255, 137, 111, 78),
                    ),
                    //height: 1000, //setarea asta s-ar putea sa ti faca probleme
                    width: 600,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            _documents?.length ?? 0,
                            (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              //+
                              //EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${index + 1}. ${_documents?[index].name} ( Price: ${_documents?[index].price} )',
                                    style: const TextStyle(
                                      fontFamily: 'Inria Serif',
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                    maxLines: 3,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            // Button 1 onPressed callback
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                            primary: const Color(0xFF101C2B),
                                          ),
                                          child: const Text('Upload'),
                                        ),
                                        const SizedBox(
                                            width:
                                                16), // Add some spacing between the buttons
                                        Visibility(
                                          visible:
                                              isButtonVisible, // Set the visibility condition
                                          maintainSize: true,
                                          maintainAnimation: true,
                                          maintainState: true,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              // Button 2 onPressed callback
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                              ),
                                              primary: const Color(0xFF101C2B),
                                            ),
                                            child: Text('Button 2'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Image.asset('images/schema.png'),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          // Set padding from content above
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ToDoListPage(
                                      TaskName: widget.selectedOption),
                                ),
                              );
                            },
                            style: ButtonStyle(
                              // Customize background color
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xff293441)),

                              // Customize button padding
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                              ),

                              // Customize border
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  side: const BorderSide(
                                      color: Color(0xFF101C2B)),
                                ),
                              ),
                            ),
                            child: const Text('Incepe operatiunea',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Image.asset('images/orase.png'),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const ButtomNavigationBar(),
    );
  }
}
