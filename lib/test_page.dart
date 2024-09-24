import 'package:flutter/material.dart';
import 'package:note_app/abbreviations/buttons/perfect_button.dart';
import 'package:note_app/abbreviations/buttons/row_buttons.dart';
import 'abbreviations/styles/textStyles.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Test Page'),
        ),
        body: Center(
          child: RowButton(
            width: 200,
            widgets: [
              Text(
                'heal',
                style: blackAndWhite,
              ),
              Text(
                'ma3alem',
                style: blackAndWhite,
              ),
            ],
          ),
        ));
  }
}
