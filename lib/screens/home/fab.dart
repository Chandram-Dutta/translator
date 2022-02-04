import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translator/translator.dart';

import '../../providers/translate_text_provider.dart';

class FAB extends ConsumerWidget {
  const FAB({
    Key? key,
    required TextEditingController textController,
  })  : _textController = textController,
        super(key: key);

  final TextEditingController _textController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () async {
        Translation translated;
        final translator = GoogleTranslator();
        if (ref.watch(translateToProvider) == 'English') {
          translated =
              await translator.translate(_textController.text, to: 'en');
        } else if (ref.watch(translateToProvider) == 'Spanish') {
          translated =
              await translator.translate(_textController.text, to: 'es');
        } else if (ref.watch(translateToProvider) == 'French') {
          translated =
              await translator.translate(_textController.text, to: 'fr');
        } else if (ref.watch(translateToProvider) == 'German') {
          translated =
              await translator.translate(_textController.text, to: 'de');
        } else if (ref.watch(translateToProvider) == 'Italian') {
          translated =
              await translator.translate(_textController.text, to: 'it');
        } else if (ref.watch(translateToProvider) == 'Portuguese') {
          translated =
              await translator.translate(_textController.text, to: 'pt');
        } else if (ref.watch(translateToProvider) == 'Russian') {
          translated =
              await translator.translate(_textController.text, to: 'ru');
        } else if (ref.watch(translateToProvider) == 'Turkish') {
          translated =
              await translator.translate(_textController.text, to: 'tr');
        } else if (ref.watch(translateToProvider) == 'Chinese') {
          translated =
              await translator.translate(_textController.text, to: 'zh');
        } else if (ref.watch(translateToProvider) == 'Japanese') {
          translated =
              await translator.translate(_textController.text, to: 'ja');
        } else if (ref.watch(translateToProvider) == 'Korean') {
          translated =
              await translator.translate(_textController.text, to: 'ko');
        } else if (ref.watch(translateToProvider) == 'Vietnamese') {
          translated =
              await translator.translate(_textController.text, to: 'vi');
        } else if (ref.watch(translateToProvider) == 'Hindi') {
          translated =
              await translator.translate(_textController.text, to: 'hi');
        } else if (ref.watch(translateToProvider) == 'Bengali') {
          translated =
              await translator.translate(_textController.text, to: 'bn');
        } else {
          translated =
              await translator.translate(_textController.text, to: 'en');
        }
        ref.read(translateTextProvider.state).state = translated.toString();
      },
      child: const Icon(Icons.translate),
      tooltip: 'Translate',
    );
  }
}
