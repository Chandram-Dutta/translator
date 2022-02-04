import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translator/translator.dart';
import 'package:translex/screens/home/fab.dart';

import '../../providers/translate_text_provider.dart';
import '../../responsive/responsive.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController _textController = TextEditingController();

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
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextField(
              controller: _textController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
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
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SelectableText(ref.watch(translateTextProvider)),
          ),
        ),
      )
    ];

    return Scaffold(
      floatingActionButton: FAB(textController: _textController),
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
                  applicationIcon: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset("assets/logo512.png")));
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    const Text("Translate to  "),
                    DropdownButton<String>(
                      value: ref.watch(translateToProvider),
                      icon: const Icon(Icons.arrow_drop_down_rounded),
                      style: TextStyle(color: Theme.of(context).primaryColor),
                      underline: Container(
                        height: 1,
                        color: Colors.transparent,
                      ),
                      onChanged: (String? newValue) {
                        ref.read(translateToProvider.state).state =
                            newValue.toString();
                      },
                      items: <String>[
                        'English',
                        'Hindi',
                        'Bengali',
                        'French',
                        'Spanish',
                        'German',
                        'Italian',
                        'Portuguese',
                        'Russian',
                        'Turkish',
                        'Chinese',
                        'Japanese',
                        'Korean'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
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
