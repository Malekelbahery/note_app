import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'main_function.dart';
import 'package:note_app/test_page.dart';
import 'package:note_app/abbreviations/styles/textStyles.dart';
import 'package:note_app/abbreviations/colours/styleColor.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyB66h4HuKR_5SnH0nW9B1gopVZVZ2X1d1o",
          appId: "com.example.note_app",
          messagingSenderId: "249925787588",
          projectId: "note-82b3f"));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    checkUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.transparent,
              foregroundColor: white,
              titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 25, color: white),
              centerTitle: true),
          scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: homestart(),
      // const TestPage(),
      routes: routePage,
    );
  }
}
