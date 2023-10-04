import 'package:authentication_2_project/Screens/HomePage.dart';
import 'package:authentication_2_project/Utils/UtilMessage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginForm extends StatefulWidget {
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey1 = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey1,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Email is Empty';
              }
              return null;
            },
            decoration: const InputDecoration(hintText: 'Enter Email'),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password is Empty';
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: 'Enter Password',
            ),
            obscureText: true,
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                login();
              },
              child: const Text('LOGIN'))
        ],
      ),
    );
  }

  Future login() async {
    if (_formKey1.currentState!.validate()) {
      await auth
          .signInWithEmailAndPassword(
              email: emailController.text.toString(),
              password: passwordController.text.toString())
          .then((value) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
      }).onError((error, stackTrace) {
        UtilMessage().toastMessage(error.toString());
      });
    }
  }
}
