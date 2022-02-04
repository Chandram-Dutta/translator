import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                applicationLegalese: 'MIT LICENSE ©2021-22 Chandram Dutta',
              );
            },
          ),
        ],
      ),
    );
  }
}
