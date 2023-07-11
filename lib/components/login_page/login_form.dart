import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../core/dashboard/dashboard_page.dart';
import '../../core/registration/otp_page.dart';
import '../../widgets.dart';
import '../../profile_tab.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  Widget _buildIos(BuildContext context) {
    return const SizedBox(width: 300, child: MyCustomForm());
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildIos,
      iosBuilder: _buildIos,
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 80,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your mobile number',
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Invalid mobile number';
                  }
                  return null;
                },
              )),
          SizedBox(
              height: 80,
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Your 4 digit pin',
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Invalid pin!';
                  }
                  return null;
                },
              )),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: SizedBox(
                  width: 300,
                  child: CupertinoButton(
                    color: CupertinoColors.destructiveRed,
                    child: const Text('LOGIN'),
                    onPressed: () async {
                      setState(() {
                        _isPressed = !_isPressed;
                      });
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );

                        await Future.delayed(const Duration(seconds: 1));
                        // ignore: use_build_context_synchronously
                        Navigator.of(context, rootNavigator: true).push<void>(
                          CupertinoPageRoute(
                            title: ProfileTab.title,
                            fullscreenDialog: true,
                            builder: (context) => const DashboardPage(),
                          ),
                        );
                      }
                    },
                  ))),
          const Center(
            child: Text(
              "Forgot your pin?",
            ),
          ),
        ],
      ),
    );
  }
}
