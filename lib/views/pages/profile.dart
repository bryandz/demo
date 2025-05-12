import 'package:demo_project/data/notifier.dart';
import 'package:demo_project/views/pages/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 100.0,
          backgroundImage: AssetImage('assets/images/bg.jpg'),
        ),
        Gap(50),
        Center(
          child: TextButton(
            onPressed: () {
              selectedPageNotifier.value = 0;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return WelcomePage();
                }),
              );
            },
            child: Text('Log out'),
          ),
        ),
      ],
    );
  }
}
