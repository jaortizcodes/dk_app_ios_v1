import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../widgets.dart';
import '../../profile_tab.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BottomNavigation extends StatelessWidget {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  static const _logoutMessage = Text(
      "You can't actually log out! This is just a demo of how alerts work.");

  BottomNavigation({super.key});

  Widget _buildAndroid(BuildContext context) {
    return ElevatedButton(
      child: const Text('LOGIN',
          style: TextStyle(color: Color.fromARGB(255, 2, 12, 116))),
      onPressed: () {
        // You should do something with the result of the dialog prompt in a
        // real app but this is just a demo.
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
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message_outlined),
          label: 'Inbox',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle),
          label: 'My Account',
        ),
      ],
      // currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber,
      // onTap: _onItemTapped,
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

final colors = const [
  Colors.red,
  Colors.green,
  Colors.greenAccent,
  Colors.amberAccent,
  Colors.blue,
  Colors.amber,
];
