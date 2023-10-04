import 'package:authentication_2_project/Screens/HomePage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleSignInWidget extends StatefulWidget {
  GoogleSignInWidgetState createState() {
    return GoogleSignInWidgetState();
  }
}

class GoogleSignInWidgetState extends State<GoogleSignInWidget> {
  Future googleSignIn() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await auth.signInWithPopup(authProvider);
      } catch (e) {
        print(e);
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? userAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
        await userAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      final UserCredential userCredential =
          await auth.signInWithCredential(credential);
    }


  }

  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          googleSignIn();
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
        },
        child: Container(
            alignment: Alignment.center,
            width: 300,
            height: 80,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(50)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Sign In with Google")],
            )));
  }
}
