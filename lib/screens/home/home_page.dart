import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:signalini/components/drawer.dart';
import 'package:signalini/screens/signale/signale_page.dart';
import 'package:signalini/utils/constants.dart';
import 'package:location/location.dart';

class HomePage extends StatefulWidget {
  static const String id = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController _mapController;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Location _location = Location();

  void _checkPermission() async {
    bool _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
    }
    PermissionStatus permissionStatus = await _location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      _location.requestPermission();
    }
  }

  _onMapCreate(GoogleMapController controller) {
    try {
      _mapController = controller;
      _checkPermission();
      _location.onLocationChanged.listen((l) {
        _mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15.0),
          ),
        );
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, SignalePage.id),
          backgroundColor: greenColor,
          child: Icon(Icons.add),
        ),
        drawer: CustomDrawer(),
        body: SizedBox.expand(
          child: Stack(
            children: <Widget>[
              //Map widget
              GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: LatLng(36.7071175, 3.1686738), zoom: 10.0),
                onMapCreated: _onMapCreate,
                zoomControlsEnabled: false,
                myLocationButtonEnabled: false,
                myLocationEnabled: true,
              ),
              //App Bar
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 60.0,
                  color: whiteColor.withOpacity(0.85),
                  // padding: const EdgeInsets.only(top: 20.0),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.sort),
                        color: Colors.black,
                        iconSize: 25.0,
                        onPressed: () => _scaffoldKey.currentState.openDrawer(),
                      ),
                      Text(
                        "Signalini",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "Montserrat",
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
