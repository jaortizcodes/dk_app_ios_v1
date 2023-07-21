// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../widgets.dart';

class DashboardHeader extends StatelessWidget {
  static const _logoutMessage = Text(
      "You can't actually log out! This is just a demo of how alerts work.");

  const DashboardHeader({super.key});

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
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(children: [
        GestureDetector(
            child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.black,
                    image: const DecorationImage(
                        image: AssetImage("assets/profile_holder.png"),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color.fromRGBO(2, 2, 119, 1),
                    ))),
            onTap: () {
              // ignore: avoid_print
              print("you clicked me");
            }),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "John Doe \n +639091236789",
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
      ]),
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
