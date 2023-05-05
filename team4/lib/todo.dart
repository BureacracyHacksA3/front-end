import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;
import 'package:location/location.dart' as locator;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';


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
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(bottom: 30.0, top: 30.0),
                child:  Wrap(
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
        ),
        bottomSheet: SizedBox(
          height: 50,
          child: Footer(
            backgroundColor: const Color(0XFF101C2B),
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
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
  late maps.GoogleMapController mapController;

  void _onMapCreated(maps.GoogleMapController controller) {
    mapController = controller;
  }
  locator.Location location = locator.Location();
  late maps.LatLng _currentLocation;
  List<maps.LatLng> locations = [
    maps.LatLng(47.154308, 27.589573),
    maps.LatLng(47.157188, 27.581297),
    maps.LatLng(47.159747, 27.584777),
  ];

  Set<maps.Polyline> polylines = {};

  Future<List<maps.LatLng>> getRoute(maps.LatLng origin, maps.LatLng destination) async {
    String url =
        'https://router.project-osrm.org/route/v1/driving/${origin.longitude},${origin.latitude};${destination.longitude},${destination.latitude}?geometries=geojson';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> coordinates = data['routes'][0]['geometry']['coordinates'];
      List<maps.LatLng> points = coordinates.map((c) => maps.LatLng(c[1], c[0])).toList();
      return points;
    } else {
      throw Exception('Failed to load route');
    }
  }

  void _getCurrentLocation() async {
    try {
      var userLocation = await location.getLocation();
      setState(() {
        _currentLocation =
            maps.LatLng(userLocation.latitude!, userLocation.longitude!);
        locations.insert(0, _currentLocation);
        _getRoute();
      });
    } catch (e) {
      print('Could not get the user location: $e');
    }
  }
  Future<void> _getRoute() async {
    List<maps.LatLng> polyline = [];

    for (int i = 0; i < locations.length - 1; i++) {
      List<maps.LatLng> segment = await getRoute(
          locations[i], locations[i + 1]);
      polyline.addAll(segment);
      Color color = Color.fromARGB(
        255,
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
      );
      polylines.add(
        maps.Polyline(
          polylineId: maps.PolylineId('route$i'),
          color: color,
          width: 5,
          points: segment,
        ),
      );
    }

    setState(() {});

  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
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
          child: maps.GoogleMap(
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            initialCameraPosition: maps.CameraPosition(
              target: locations[0],
              zoom: 15.0,
            ),
            markers: locations
                .map(
                  (location) => maps.Marker(
                markerId: maps.MarkerId(location.toString()),
                position: location,
                infoWindow: maps.InfoWindow(
                  title: 'Locatie',
                ),
              ),
            )
                .toSet(),
            polylines: polylines,
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
                          child: Row(
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
                          child:  Row(
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
                          child:  Row(
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
                          child:  Row(
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
                          child:  Row(
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
                          child:  Row(
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
                          child:  Row(
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
              child: Image.asset('images/logo-ip.png', fit: BoxFit.fill),
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
