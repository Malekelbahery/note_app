import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:note_app/abbreviations/buttons/perfect_button.dart';
import 'package:note_app/abbreviations/buttons/row_buttons.dart';
import '../abbreviations/colours/styleColor.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerHome(context),
      appBar: AppBar(
        title: const Text('Home'),
      ),
    );
  }
}

drawerHome (BuildContext context){
  return Drawer(
    backgroundColor: darkBlue,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 32),
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RowButton(
                  type: MainAxisAlignment.start,
                  backgroundColor: Colors.transparent,
                  width: double.infinity,
                  height: 20,
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushReplacementNamed('login');
                  },
                  widgets: [
                    Text(
                      'Sign Out  ',
                      style: TextStyle(
                        color: red,
                      ),
                    ),
                    Icon(
                      Icons.exit_to_app,
                      color: red,
                    )
                  ])
            ],
          )),
    ),
  );
}
