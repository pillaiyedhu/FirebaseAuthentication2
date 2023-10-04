import 'package:authentication_2_project/Screens/LoginPage.dart';
import 'package:authentication_2_project/Widgets/SignUpForm.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  SignUpPageState createState() {
    return SignUpPageState();
  }
}

class SignUpPageState extends State<SignUpPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Form'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SignUpForm(),
            const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  const Text('Already Have an Account :'),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>LoginPage()
                        ));
                      },
                      child: const Text('Login'))
                ],
              ),
          ],
        ),
      )
    );
  }
}
