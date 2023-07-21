import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(const DKGMap());

class DKGMap extends StatefulWidget {
  const DKGMap({super.key});

  @override
  State<DKGMap> createState() => _DKGMapState();
}

class _DKGMapState extends State<DKGMap> {
  Completer<GoogleMapController> _controller = Completer();
  // on below line we have specified camera position
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(20.42796133580664, 121.036355),
    zoom: 14.4746,
  );

  // on below line we have created the list of markers
  final List<Marker> _markers = <Marker>[
    // const Marker(
    //     markerId: MarkerId('1'),
    //     position: LatLng(20.42796133580664, 121.036355),
    //     infoWindow: InfoWindow(
    //       title: 'My Location',
    //     )),
  ];

  // created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  final _formKey = GlobalKey<FormState>();
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Pin your location"),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: MediaQuery.of(context).size.height / .2,
            child: SafeArea(
              // on below line creating google maps
              child: GoogleMap(
                // on below line setting camera position
                initialCameraPosition: _kGoogle,
                // on below line we are setting markers on the map
                markers: Set<Marker>.of(_markers),
                // on below line specifying map type.
                mapType: MapType.normal,
                // on below line setting user location enabled.
                myLocationEnabled: true,
                // on below line setting compass enabled.
                compassEnabled: true,
                // on below line specifying controller on map complete.
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  getUserCurrentLocation().then((value) async {
                    print(value.latitude.toString() +
                        " " +
                        value.longitude.toString());
                    BitmapDescriptor markerbitmap =
                        await BitmapDescriptor.fromAssetImage(
                      ImageConfiguration(),
                      "assets/dk_pin.png",
                    );
                    // marker added for current users location
                    _markers.add(Marker(
                      markerId: MarkerId("userLocation"),
                      draggable: true,
                      position: LatLng(value.latitude, value.longitude),
                      infoWindow: InfoWindow(
                        title: 'My Current Location',
                      ),
                      onDragEnd: ((newPosition) {
                        print(newPosition.latitude);
                        print(newPosition.longitude);
                      }),
                      icon: markerbitmap,
                    ));

                    // specified current users location
                    CameraPosition cameraPosition = new CameraPosition(
                      target: LatLng(value.latitude, value.longitude),
                      zoom: 14,
                    );

                    final GoogleMapController controller =
                        await _controller.future;
                    controller.animateCamera(
                        CameraUpdate.newCameraPosition(cameraPosition));
                    setState(() {});
                  });
                },
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 1,
                  spreadRadius: 0,
                  offset: Offset(
                    0,
                    0,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2.5,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Column(children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "COMPLETE YOUR BOOKING",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Selected wallet: GCash",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Type: Cash-in",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Initial Booking Fee: P50.00",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "(Minimum booking fee from 5 kilometers and below.)",
                            style: TextStyle(
                              fontSize: 13,
                              fontStyle: FontStyle.italic,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 70,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter amount to be booked',
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Invalid amount';
                                      }
                                      return null;
                                    },
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  child: SizedBox(
                                      width: double.infinity,
                                      child: CupertinoButton(
                                        color: Color.fromARGB(255, 4, 43, 86),
                                        child: const Text('CONFIRM BOOKING'),
                                        onPressed: () async {
                                          setState(() {
                                            _isPressed = !_isPressed;
                                          });
                                          if (_formKey.currentState!
                                              .validate()) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content:
                                                      Text('Processing Data')),
                                            );

                                            showDialog(
                                                context: context,
                                                barrierDismissible: false,
                                                builder:
                                                    (BuildContext context) {
                                                  return Dialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    backgroundColor:
                                                        Colors.white,
                                                    child: Container(
                                                      constraints:
                                                          const BoxConstraints(
                                                              maxHeight: 350),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          left: 12.0,
                                                          right: 12.0,
                                                          top: 40,
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Image.asset(
                                                              'assets/dala_logo_white.png',
                                                              height: 120,
                                                              width: 120,
                                                            ),
                                                            const Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .only(
                                                                top: 22,
                                                              ),
                                                              child:
                                                                  CircularProgressIndicator(
                                                                backgroundColor:
                                                                    Colors
                                                                        .amberAccent,
                                                                valueColor:
                                                                    AlwaysStoppedAnimation(
                                                                        Colors
                                                                            .grey),
                                                                strokeWidth: 10,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                top: 12,
                                                              ),
                                                              child: RichText(
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                text: const TextSpan(
                                                                    text:
                                                                        "Looking for a rider...",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .black,
                                                                        wordSpacing:
                                                                            1)),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                top: 45,
                                                              ),
                                                              child: SizedBox(
                                                                width: 300,
                                                                child:
                                                                    CupertinoButton(
                                                                  color: CupertinoColors
                                                                      .destructiveRed,
                                                                  child: const Text(
                                                                      'CANCEL BOOKING'),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context,
                                                                        true);
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                          }
                                        },
                                      ))),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
