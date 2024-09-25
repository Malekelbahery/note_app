import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
    this.width = 150,
    this.height = 40,
    this.radius = 100,
    this.backgroundColor = Colors.black,
    this.typeAlignment = MainAxisAlignment.center,
    this.typeSize = MainAxisSize.min,
    required this.widgets,
  });

  final double height;
  final double width;
  final Color backgroundColor;
  final double radius;
  final MainAxisAlignment typeAlignment;
  final List<Widget> widgets;
  final MainAxisSize typeSize;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        signInWithGoogle();
        Navigator.of(context).pushReplacementNamed('home');
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        child: Row(
          mainAxisSize: typeSize,
          mainAxisAlignment: typeAlignment,
          children: widgets,
        ),
      ),
    );
  }
}
