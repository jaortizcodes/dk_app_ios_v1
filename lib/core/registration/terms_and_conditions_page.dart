import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets.dart';
import '../registration/registration_page.dart';

class TermsAndConditionsPage extends StatelessWidget {
  static const title = 'Terms and Conditions';
  static const androidIcon = Icon(Icons.person);
  static const iosIcon = Icon(CupertinoIcons.profile_circled);

  const TermsAndConditionsPage({super.key});

  Widget _buildBody(BuildContext context) {
    return const Column(children: [
      Expanded(
          child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              children: [
                Text(
                  """ A.Please read these terms and conditions (these “Terms”) carefully. Once accepted, they shall constitute the contract ("Contract”) between you and us that governs your access and use of the Dala-Kuha mobile application (“application”) and your contractual relations to us in general, which shall comprise:
            \ni. Contractual relations arising from your use of the Dala-Kuha mobile application provided by us or our affiliates including those concerning the storage, sharing and processing of files, materials, data, or other content;
            \nii. For Dala-Kuha business partners, agents, contractors, or sub-contractors; contractual relations arising from our separate agreements as may be enforced, executed, complied, or performed through the use of the Dala-Kuha mobile application;
            \niii.Contractual relations arising from any support, maintenance or other services we provide in relation to the Dala-Kuha mobile application;
            \niv.Contractual relations arising from any written or electronic use or features guides, videos or other documentation of the Dala-Kuha mobile application, provided or made available by us or our affiliates (the "User Guides").

        B. BY REGISTERING FOR AN ACCOUNT OR DOWNLOADING AND USING THE DALA-KUHA MOBILE APPLICATION, YOU ARE INDICATING YOUR ACCEPTANCE OF THESE TERMS AND ARE AGREEING TO BE BOUND BY AND A PARTY TO THIS BINDING CONTRACT.

        C. IF YOU DO NOT AGREE WITH THESE TERMS, OR DO NOT HAVE THE AUTHORITY TO AGREE TO THEM ON BEHALF OF YOUR COMPANY, CORPORATION, PARTNERSHIP, ASSOCIATION, GOVERNMENT, GOVERNMENT INSTITUTION, GOVERNMENT OWNED AND CONTROLLED CORPORATION, PUBLIC OR PRIVATE EMPLOYER, PRINCIPAL, OR ANY OTHER ENTITY OR PERSON FOR WHICH/WHOM YOU PURPORT TO BE AN AGENT, EMPLOYEE OR REPRESENTATIVE (COLLECTIVELY REFERRED HEREAFTER AS "ORGANIZATION”),YOU MUST NOT REGISTER FOR AN ACCOUNT WITH US AND MUST NOT USE THE DALA-KUHA APPLICATION.
        \n\n
        D. You may not access the Services if you are our direct competitor, except with our prior written consent. In addition, you may not access the application for purposes of monitoring their availability, performance or functionality, or for any other benchmarking or competitive purposes.
        \n\n
        E. Business users: If you are not an individual user or consumer and are using the Services on behalf of an organization:
        \n\n
      \ni. you are agreeing to these Terms for and on behalf of your organization and represent and warrant to us that you have the authority to bind that organization to these Terms (in which event, "you” and "your" will refer to that organization);
\nii. you agree that you are responsible for your organization representative’s compliance with these Terms and for their use of the application;
\niii. you agree that you have obtained from your organization representative any consent including but is not limited to his/her/their consent for the collection and processing of their personal data as required in these Terms or which is necessary to allow us to provide, furnish,  and/or maintain the application;
\niv. you may use the application only in compliance with these Terms and only if you have the power to form a contract with us and are not barred under any applicable law from doing so; and
\nv. your use of the application shall be exclusively governed by these Terms and the policies referred to or incorporated herein and its future amendments, except where any separate written agreement in writing, governing your contractual relationship with us, has been executed;
\nvi. In the event that a separate agreement was validly executed as described in the foregoing item, but which does not expressly provide that it supersedes these Terms, it is agreed and understood that your use of the application shall continue to be governed by these Terms, and that these terms shall prevail in case of contradictions or inconsistencies.
        \n
        F. Please note that, to the maximum extent permitted by applicable law and except as set out in these Terms, we do not provide warranties for the application or the services rendered through the same. This contract also limits our liability to you.
        \n
        G. This Privacy Policy covers how DALA-KUHA SERVICES INC. (“Dala-Kuha”, “we”, “us” or “our”) collects, uses, shares, retains and protects your personal information. It also tells you what steps you can take if you want us to change how we use your personal information, or if you want us to stop using your personal information.
""",
                  style: TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.none,
                      fontFamily: 'Raleway'),
                ),

                // Expanded(
                //   child: Container(),
                // ),
                LogOutButton(),
              ],
            ),
          ),
        ),
      ))
    ]);
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        middle: const Text("Terms and Conditions"),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Text("Accept"),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).push<void>(
              CupertinoPageRoute(
                title: RegistrationPage.title,
                fullscreenDialog: true,
                builder: (context) => const RegistrationPage(),
              ),
            );
          },
        ),
      ),
      child: _buildBody(context),
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

class LogOutButton extends StatelessWidget {
  static const _logoutMessage = Text(
      "You can't actually log out! This is just a demo of how alerts work.");

  const LogOutButton({super.key});

  Widget _buildAndroid(BuildContext context) {
    return ElevatedButton(
      child: const Text('LOG OUT', style: TextStyle(color: Colors.red)),
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
    return CupertinoButton(
      color: CupertinoColors.destructiveRed,
      child: const Text('Log outs'),
      onPressed: () {
        showCupertinoModalPopup<void>(
          context: context,
          builder: (context) {
            return CupertinoActionSheet(
              title: const Text('Log out?'),
              message: _logoutMessage,
              actions: [
                CupertinoActionSheetAction(
                  isDestructiveAction: true,
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Reprogram the night man'),
                ),
                CupertinoActionSheetAction(
                  child: const Text('Got it'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
              cancelButton: CupertinoActionSheetAction(
                isDefaultAction: true,
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
            );
          },
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
