import 'package:authentication_2_project/Screens/SignUpPage.dart';
import 'package:authentication_2_project/Widgets/GoogleSignInWidget.dart';
import 'package:authentication_2_project/Widgets/LoginForm.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPageState createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginForm'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            LoginForm(),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                const Text('Dont Have an Account :'),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SignUpPage();
                        },
                      ));
                    },
                    child: const Text('Sign Up'))
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            GoogleSignInWidget()
          ],
        ),
      ),
    );
  }
}
