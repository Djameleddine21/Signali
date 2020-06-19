import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:signalini/components/drawer.dart';
import 'package:signalini/screens/signale/signale_page.dart';
import 'package:signalini/utils/constants.dart';

class HomePage extends StatefulWidget {
  static const String id = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController _mapController;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _onMapCreate(GoogleMapController controller) {
    _mapController = controller;
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
          onPressed: ()=> Navigator.pushNamed(context, SignalePage.id),
          backgroundColor: greenDeepColor,
          child: Icon(Icons.add),
        ),
        drawer: CustomDrawer(),
        body: SizedBox.expand(
          child: Stack(
            children: <Widget>[
              //Map widget
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(30.0, 25.0),
                  zoom: 5.0,
                ),
                onMapCreated: _onMapCreate,
                zoomControlsEnabled: false,
              ),
              //App Bar
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 50.0,
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
