import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note_app/acount/pages/login.dart';
import 'package:note_app/acount/pages/regist.dart';
import 'package:note_app/app/home.dart';

Map<String, Widget Function(BuildContext)> routePage = {
  'home': (context) => const Home(),
  'login': (context) => const Login(),
  'register': (context) => const Register(),
};

checkUser() {
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      if (kDebugMode) {
        print('00000000000000000000000000000000000');
      }
    } else {
      if (kDebugMode) {
        print('11111111111111111111111111111111111');
      }
    }
  });
}

homestart() {
  StatefulWidget startWith;
  if (FirebaseAuth.instance.currentUser != null &&
      FirebaseAuth.instance.currentUser!.emailVerified) {
    startWith = const Home();
  } else {
    startWith = const Login();
  }
  return startWith;
}
