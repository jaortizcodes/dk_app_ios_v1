// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../components/registration/otp_form.dart';
import '../../widgets.dart';

class OTPPage extends StatefulWidget {
  static const title = 'Registration';

  const OTPPage({super.key, this.androidDrawer});

  final Widget? androidDrawer;

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  // static const _itemsLength = 50;

  // final _androidRefreshKey = GlobalKey<RefreshIndicatorState>();

  late List<MaterialColor> colors;
  late List<String> songNames;

  @override
  void initState() {
    // _setData();
    super.initState();
  }

  void _togglePlatform() {
    // ignore: avoid_print
    print("Toggling platform");
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
    } else {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    }

    // This rebuilds the application. This should obviously never be
    // done in a real app but it's done here since this app
    // unrealistically toggles the current platform for demonstration
    // purposes.
    WidgetsBinding.instance.reassembleApplication();
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(120.0),
                  child: Column(children: [
                    const Text(
                      "Welcome to",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Image.asset(
                      'assets/dala_logo_white.png',
                      height: 120,
                      width: 120,
                    ),
                    const Text(
                      "Ride and earn",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 5, 70, 122),
                          fontStyle: FontStyle.italic),
                    ),
                  ]),
                ),
              ],
            ),
          ],
        ), /* add child content here */
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePlatform,
        backgroundColor: Colors.green,
        child: const Icon(Icons.restart_alt),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 120.0),
                    child: Column(children: [
                      Image.asset(
                        'assets/dala_logo_white.png',
                        height: 150,
                        width: 150,
                      ),
                    ]),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(children: [
                      OTPForm(),
                    ]),
                  ),
                ],
              ),
            ],
          ),
        ), /* add child content here */
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePlatform,
        backgroundColor: Colors.green,
        child: const Icon(Icons.restart_alt),
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
