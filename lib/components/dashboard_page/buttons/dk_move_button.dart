// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class DKMoveButton extends StatelessWidget {
  static const _logoutMessage = Text(
      "You can't actually log out! This is just a demo of how alerts work.");

  const DKMoveButton({super.key});

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
    return Builder(
      builder: (context) {
        return Center(
          child: GestureDetector(
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(21),
                  image: const DecorationImage(
                      image: AssetImage("assets/cashin.png"),
                      fit: BoxFit.cover),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: const Color.fromRGBO(2, 2, 119, 1),
                  )),
            ),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const Wrap(
                    children: [
                      ListTile(
                        // leading: Icon(Icons.share),
                        title: Text('GCash'),
                      ),
                      ListTile(
                        // leading: Icon(Icons.copy),
                        title: Text('Maya'),
                      ),
                      ListTile(
                        // leading: Icon(Icons.edit),
                        title: Text('EMango'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        );
      },
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
