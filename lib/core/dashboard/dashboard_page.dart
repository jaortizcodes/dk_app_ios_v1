// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import '../../components/dashboard_page/card.dart';
import '../../components/bottom_navigation.dart';
import '../../components/dashboard_page/action_buttons.dart';
import '../../components/dashboard_page/base_carousel.dart';
import '../../components/dashboard_page/card_regular.dart';
import '../../components/dashboard_page/dk_bottom_sheet.dart';
import '../../components/dashboard_page/header.dart';
import '../../components/landing_page/be_a_member.dart';
import '../../components/landing_page/login.dart';
import '../../logo/logo.dart';
import '../../widgets.dart';
import '../landing_page.dart';

class DashboardPage extends StatefulWidget {
  static const title = 'Dala-Kuha';

  // static const iosIcon = Icon(CupertinoIcons.profile_icon);

  const DashboardPage({super.key, this.androidDrawer});

  final Widget? androidDrawer;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
    Future<bool> showExitPopup() async {
      return await showDialog(
            //show confirm dialogue
            //the return value will be from "Yes" or "No" options
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Exit App'),
              content: Text('Do you want to exit the application?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('No'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LandingPage()),
                      (Route route) => false),
                  child: Text('Yes'),
                ),
              ],
            ),
          ) ??
          false; //if showDialog had returned null, then return false
    }

    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background_round.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
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
                  height: MediaQuery.of(context).size.height / 1.60,
                  // padding: const EdgeInsets.all(52.0),

                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: Column(children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Know more",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            BaseCarousel(),
                            // DKBottomSheet(),
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Column(children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Discounts and Promotions",
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            BaseCarousel()
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / .35,
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(children: [
                      MainLogo(),
                      Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: ActionButtons()),
                    ]),
                  ),
                ),
              ],
            ),
          ), /* add child content here */
        ),
        bottomNavigationBar: BottomNavigation(),
        floatingActionButton: FloatingActionButton(
          onPressed: _togglePlatform,
          backgroundColor: Colors.green,
          child: const Icon(Icons.navigation),
        ),
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
