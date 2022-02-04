import 'package:flutter/material.dart';
import 'package:translator/responsive/responsive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgets = [
      Expanded(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
        width: 10,
      ),
      Expanded(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Translator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.theater_comedy),
            tooltip: "Change Theme",
            onPressed: () {
              Navigator.pushNamed(context, '/themes');
            },
          ),
          IconButton(
            icon: const Icon(Icons.info),
            tooltip: "App Info",
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: 'Translator',
                applicationVersion: 'Version 0.1',
                applicationLegalese: 'MIT LICENSE\n©2021-22 Chandram Dutta',
              );
            },
          ),
        ],
      ),
      body: isDesktop(context, 800)
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: _widgets,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: _widgets,
              ),
            ),
    );
  }
}
