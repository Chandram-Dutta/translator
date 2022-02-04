import 'package:flutter/material.dart';
import 'package:translator/responsive/responsive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgets = [
      Expanded(
        child: Container(
          height: isDesktop(context, 800) ? double.infinity : null,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(5.0),
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter text to translate',
              ),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
        width: 10,
      ),
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      )
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.translate),
        tooltip: 'Translate',
      ),
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
