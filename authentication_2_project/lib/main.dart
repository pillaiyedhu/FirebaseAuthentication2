import 'package:authentication_2_project/Screens/LoginPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD_8qCZsLUnOyi7DEoO4Ue9qJ0u0qtJCMY",
            authDomain: "authenticationtry-9ecf0.firebaseapp.com",
            projectId: "authenticationtry-9ecf0",
            //storageBucket: "authenticationtry-9ecf0.appspot.com",
            messagingSenderId: "686336303075",
            appId: "1:686336303075:web:099b15fbbb1557fb380ad6"));
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
