import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app/abbreviations/buttons/perfect_button.dart';
import 'package:note_app/abbreviations/text_Form/text_Form_Field_Number1.dart';
import 'package:note_app/abbreviations/styles/textStyles.dart';

import '../../abbreviations/colours/styleColor.dart';

TextEditingController _name = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();
GlobalKey<FormState> _registerKey = GlobalKey();

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _registerKey,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              heightApp(10),
              //
              textHeyThere(),
              //
              textWelcome(),
              //
              heightApp(30),
              //
              //
              // text field come
              //
              //
              textFieldName(),
              //
              heightApp(20),
              //
              textFieldEmail(),
              //
              heightApp(20),
              //
              textFieldPassword(),
              //
              //
              // Buttons
              //
              //
              heightApp(60),
              //
              registerButton(context),
              //
              //
              // navigator
              //
              //
              heightApp(100),
              //
              loginText(),
              //
              signIn(
                () {
                  Navigator.of(context).pushReplacementNamed('login');
                },
              ),
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
      'Welcome',
      style: TextStyle(
          fontFamily: 'nice',
          color: Colors.white,
          // fontWeight: FontWeight.bold,
          fontSize: 40),
    ),
  );
}

textFieldName() {
  return TextFormField1(
    controller: _name,
    text: 'name',
    validator: (val) {
      if (val == '') {
        return 'please enter your name';
      } else {
        return null;
      }
    },
    type: TextInputType.name,
    icon: const Icon(Icons.text_fields),
  );
}

textFieldEmail() {
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

textFieldPassword() {
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

registerButton(BuildContext context) {
  return PerfectButton(
    width: double.infinity,
    onTap: () async {
      if (_registerKey.currentState!.validate()) {
        try {
          final credential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email.text,
            password: _password.text,
          );
          credential.user!.sendEmailVerification();
          if (credential.user!.emailVerified) {
            Navigator.of(context).pushReplacementNamed('home');
          } else {
            snackBarMassage(context, 'Check your email', white);
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            snackBarMassage(context, 'The password provided is too weak.', red);
          } else if (e.code == 'email-already-in-use') {
            snackBarMassage(context, 'email is already token', red);
          }
        } catch (e) {
          snackBarMassage(context, '$e', red);
        }
      } else {
        snackBarMassage(
            context, 'please enter name and email and password', red);
      }
    },
    title: 'Sign Up',
    height: 50,
    radius: 15,
  );
}

loginText() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        'Log',
        style: TextStyle(
            color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
      ),
      Text(
        'in',
        style: TextStyle(
            color: Colors.purple.shade700,
            fontWeight: FontWeight.bold,
            fontSize: 50),
      )
    ],
  );
}

signIn(void Function()? onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "you already have an account? ",
        style: TextStyle(color: Colors.white),
      ),
      InkWell(
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: const Text(
          'Login',
          style: TextStyle(color: Colors.purple),
        ),
      )
    ],
  );
}
