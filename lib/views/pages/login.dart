import 'package:demo_project/views/widget_tree.dart';
import 'package:demo_project/views/widgets/hero.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var cEmail = TextEditingController(text: '123');
  var cPassword = TextEditingController(text: '456');
  String confirmedEmail = '123';
  String confirmedPw = '456';

  @override
  void dispose() {
    cEmail.dispose();
    cPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const HeroWidget(title: 'Login'),
                Gap(20),
                TextField(
                  controller: cEmail,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onEditingComplete: () {

                  },
                ),
                Gap(10),
                TextField(
                  controller: cPassword,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onEditingComplete: () => setState(() {}),
                ),
                Gap(20),
                FilledButton(
                  onPressed: () {
                    onLoginPressed();
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 35),
                  ),
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onLoginPressed() {
    if (confirmedEmail == cEmail.text && confirmedPw == cPassword.text) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WidgetTree()),
      );
    }
  }
}
