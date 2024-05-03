// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(21.423542, 39.825780);
  Set<Circle> _circles = {};
  Map<CircleId, Map<String, dynamic>> _circleInfo = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _loadCircles();
  }

  Future<void> _loadCircles() async {
    String data = await rootBundle.loadString('assets/json/data.json');
    var jsonData = json.decode(data);

    Set<Circle> circles = {};
    for (var u in jsonData['locations']) {
      CircleId circleId = CircleId(u['id'].toString());
      circles.add(
        Circle(
            circleId: circleId,
            center: LatLng(u['lat'], u['lng']),
            radius: 10, // Adjust the radius as needed
            fillColor: u['condition'] == 'green'
                ? Colors.green.withOpacity(0.5)
                : Colors.red.withOpacity(0.5),
            strokeWidth: 10,
            strokeColor: u['condition'] == 'green' ? Colors.green : Colors.red,
            consumeTapEvents: true,
            onTap: () {
              _showBottomSheet(circleId);
            }),
      );

      _circleInfo[circleId] = {
        "place": u['place'],
        "status": u['status'],
        "distance": u['distance'],
        "photoLink": u['photoLink']
      };
    }

    setState(() {
      _circles = circles;
    });
  }

  void _showBottomSheet(CircleId circleId) {
    final info = _circleInfo[circleId];
    if (info != null) {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        builder: (BuildContext context) {
          return Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          children: [
                            Text('المكان: ${info['place']}',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            Text("الحالة : ${info['status']}",
                                style: TextStyle(fontSize: 16),textAlign: TextAlign.start,),
                            SizedBox(height: 5),
                            Text(
                              "المسافة : ${info['distance']}",
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Image.network(
                          info['photoLink'],
                          fit: BoxFit.cover,
                          width: 100,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color(0xff0F2B3E),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        title: Text(
          'اكتشف المواقع',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'DIN',
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 17.0,
        ),
        circles: _circles,
      ),
    );
  }
}
