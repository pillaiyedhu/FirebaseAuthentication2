// import 'package:authentication_2_project/Screens/LoginPage.dart';
import 'package:authentication_2_project/Screens/LoginPage.dart';
import 'package:authentication_2_project/Utils/UtilMessage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpForm extends StatefulWidget {
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

class SignUpFormState extends State<SignUpForm> {
  final _emailController2 = TextEditingController();
  final _passwordController2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _emailController2.dispose();
    _passwordController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController2,
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
            controller: _passwordController2,
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
                signUp();
              },
              child: const Text('SIGN UP'))
        ],
      ),
    );
  }

  Future signUp() async {
    if (_formKey.currentState!.validate()) {
      await auth
          .createUserWithEmailAndPassword(
              email: _emailController2.text.toString(),
              password: _passwordController2.text.toString())
          .then((value) {
            Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return LoginPage();
          },
        ));
        
      }).onError((error, stackTrace) {
        UtilMessage().toastMessage(error.toString());
      });
    }
  }
}
