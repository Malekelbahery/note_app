import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app/abbreviations/buttons/perfect_button.dart';
import 'package:note_app/abbreviations/text_Form/text_Form_Field_Number1.dart';
import 'package:note_app/abbreviations/styles/textStyles.dart';
import 'package:note_app/abbreviations/colours/styleColor.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();
GlobalKey<FormState> _loginKey = GlobalKey();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _loginKey,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              heightApp(10),
              textHeyThere(),
              textWelcome(),
              heightApp(30),
              //
              // text field come
              //
              textField1(),
              heightApp(20),
              textField2(),
              //
              // Buttons
              //
              forgetButton(),
              heightApp(60),
              loginButton(context),
              //
              // navigator
              //
              heightApp(100),
              loginPlus(),
              signUp(context),
            ],
          ),
        ),
      ),
    );
  }
}

textHeyThere() {
  return const Center(
    child: Text(
      'Hey there',
      style: TextStyle(color: Colors.white, fontSize: 18),
    ),
  );
}

textWelcome() {
  return const Center(
    child: Text(
      'Welcome Back',
      style: TextStyle(
          fontFamily: 'nice',
          color: Colors.white,
          // fontWeight: FontWeight.bold,
          fontSize: 40),
    ),
  );
}

textField1() {
  return TextFormField1(
    controller: _email,
    text: 'email',
    validator: (val) {
      if (val == '') {
        return 'please enter your email';
      } else {
        return null;
      }
    },
    type: TextInputType.emailAddress,
    icon: const Icon(Icons.email),
  );
}

textField2() {
  return TextFormField1(
    controller: _password,
    text: 'password',
    validator: (val) {
      if (val == '') {
        return 'please enter your password';
      } else {
        return null;
      }
    },
    obscureText: true,
    type: TextInputType.visiblePassword,
    icon: const Icon(Icons.lock),
  );
}

forgetButton() {
  return TextButton(
      onPressed: () {},
      child: Text(
        'forget Password?',
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey.shade500,
          decoration: TextDecoration.underline,
          decorationColor: Colors.grey,
        ),
      ));
}

loginButton(BuildContext context) {
  return PerfectButton(
    width: double.infinity,
    onTap: () async {
      if (_loginKey.currentState!.validate()) {
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _email.text,
            password: _password.text,
          );
          if (credential.user!.emailVerified) {
            Navigator.of(context).pushReplacementNamed('home');
          } else {
            credential.user!.sendEmailVerification();
            snackBarMassage(context, 'Check your email', white);
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            snackBarMassage(context, 'No user found for that email.', red);
          } else if (e.code == 'wrong-password') {
            snackBarMassage(
                context, 'Wrong password provided for that user.', red);
          }
        }
      } else {
        snackBarMassage(context, 'please enter email and password', red);
      }
    },
    title: 'Login',
    height: 50,
    radius: 15,
  );
}

loginPlus() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        'Login',
        style: TextStyle(
            color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
      ),
      Text(
        '+',
        style: TextStyle(
            color: Colors.purple.shade700,
            fontWeight: FontWeight.bold,
            fontSize: 50),
      )
    ],
  );
}

signUp(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "don't have an account yet? ",
        style: TextStyle(color: Colors.white),
      ),
      InkWell(
        highlightColor: Colors.transparent,
        onTap: () {
          Navigator.of(context).pushReplacementNamed('register');
        },
        child: const Text(
          'Register',
          style: TextStyle(color: Colors.purple),
        ),
      )
    ],
  );
}
