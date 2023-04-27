import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'InriaSerif',
          checkboxTheme: CheckboxThemeData(
            checkColor: MaterialStateProperty.all(Colors.white),
            fillColor: MaterialStateProperty.all(Colors.white),
          )),
      home: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: NavigationBar(),
        ),
        drawer: Drawer(
          backgroundColor: const Color(0xFF896F4E),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                title: const Text('Home',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Institutions',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Contact',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('My Account',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Color(0XFF293441),
            border: Border(
              top: BorderSide(
                width: 1,
                color: Color(0xFF896F4E),
              ),
              bottom: BorderSide(
                width: 1,
                color: Color(0xFF896F4E),
              ),
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Container(
              margin: const EdgeInsets.only(bottom: 30.0),
              child: const Wrap(
                alignment: WrapAlignment.spaceAround,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                children: [
                  MyMap(),
                  ToDoList(),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: SizedBox(
          height: 50,
          child: Footer(
            backgroundColor: const Color(0XFF101C2B),
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Email: groupA3@gmail.com',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: 'InriaSerif'),
                ),
                Text(
                  'Phone: 0710293847',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: 'InriaSerif'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyMap extends StatefulWidget {
  const MyMap({super.key});

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(47.1561373, 27.5869704);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        border: Border.all(
          width: 3.0,
          color: const Color(0xFF896F4E),
          )
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        child: SizedBox(
            width: 700.0,
            height: 500.0,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
          ),
        ),
      ),
    );
  }
}

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});
  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color(0XFF101C2B),
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Column(
              children: [
                const Text(
                  'TO DO',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15.0),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF896F4E),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                              width: 2,
                              color: Color(0XFF101C2B),
                            )),
                          ),
                          child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Certificat de naștere',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                Checkbox(
                                  value: true,
                                  onChanged: null,
                                ),
                              ]),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                              width: 2,
                              color: Color(0XFF101C2B),
                            )),
                          ),
                          child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Certificat de căsătorie',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                Checkbox(
                                  value: true,
                                  onChanged: null,
                                ),
                              ]),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                              width: 2,
                              color: Color(0XFF101C2B),
                            )),
                          ),
                          child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Certificat de naștere copil',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                Checkbox(
                                  value: true,
                                  onChanged: null,
                                ),
                              ]),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                              width: 2,
                              color: Color(0XFF101C2B),
                            )),
                          ),
                          child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Cerere pentru eliberare act',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                Checkbox(
                                  value: true,
                                  onChanged: null,
                                ),
                              ]),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                              width: 2,
                              color: Color(0XFF101C2B),
                            )),
                          ),
                          child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Dovadă adresa de domiciliu',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                Checkbox(
                                  value: true,
                                  onChanged: null,
                                ),
                              ]),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                              width: 2,
                              color: Color(0XFF101C2B),
                            )),
                          ),
                          child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Carte de alegător',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                Checkbox(
                                  value: true,
                                  onChanged: null,
                                ),
                              ]),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Chitanță',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                Checkbox(
                                  value: true,
                                  onChanged: null,
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50.0),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF896F4E),
                      padding: const EdgeInsets.only(
                          left: 50.0, right: 50.0, top: 15.0, bottom: 15.0),
                    ),
                    child: const Text('FINISH',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationBar extends StatefulWidget {
  const NavigationBar({super.key});
  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  bool _isMobile = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 768) {
      _isMobile = true;
    } else {
      _isMobile = false;
    }

    return Container(
      color: const Color(0XFF101C2B),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset('assets/images/logoip.png', fit: BoxFit.fill),
            ),
            _isMobile
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            Scaffold.of(context).openDrawer();
                          });
                        },
                      ),
                    ],
                  )
                : Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextButton(
                            onPressed: () {}, //link catre
                            child: const Text(
                              'Home',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextButton(
                            onPressed: () {}, //link catre
                            child: const Text(
                              'Institutions',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextButton(
                            onPressed: () {}, //link catre
                            child: const Text(
                              'Contact',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextButton(
                            onPressed: () {}, //link catre
                            child: const Text(
                              'My Account',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            )),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
