// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../logo/logo.dart';
import '../widgets.dart';
import '../components/landing_page/be_a_member.dart';
import '../components/landing_page/login.dart';

class LandingPage extends StatefulWidget {
  static const title = 'Dala-Kuha';

  const LandingPage({super.key, this.androidDrawer});

  final Widget? androidDrawer;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Column(children: [
                    BeAMemberButton(),
                    LoginButton(),
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
        child: const Icon(Icons.navigation),
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: const Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.all(120.0),
                  child: Column(children: [
                    Text(
                      "Welcome to",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    MainLogo(),
                    Text(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Column(children: [
                    BeAMemberButton(),
                  ]),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(children: [
                    LoginButton(),
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
        child: const Icon(Icons.navigation),
      ),
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
