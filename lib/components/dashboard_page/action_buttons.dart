// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../widgets.dart';

import 'buttons/cash_in_button.dart';
import 'buttons/cash_out_button.dart';
import 'buttons/dk_move_button.dart';
import 'buttons/dk_ride_button.dart';

class ActionButtons extends StatelessWidget {
  static const _logoutMessage = Text(
      "You can't actually log out! This is just a demo of how alerts work.");

  const ActionButtons({super.key});

  Widget _buildAndroid(BuildContext context) {
    return ElevatedButton(
      child: const Text('LOGIN',
          style: TextStyle(color: Color.fromARGB(255, 2, 12, 116))),
      onPressed: () {
        showDialog<void>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Log out?'),
              content: _logoutMessage,
              actions: [
                TextButton(
                  child: const Text('Got it'),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildIos(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
              spreadRadius: 0,
              offset: Offset(
                0,
                2,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            width: 0.8,
            color: Colors.grey,
          )),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              CashInButton(),
              Text(
                "Cash In",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Column(
            children: [
              CashOutButton(),
              Text(
                "Cash Out",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Column(
            children: [
              DKMoveButton(),
              Text(
                "DK Move",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Column(
            children: [
              DKRideButton(),
              Text(
                "DK Ride",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
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
