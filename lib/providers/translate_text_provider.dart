import 'package:flutter_riverpod/flutter_riverpod.dart';

final translateTextProvider = StateProvider<String>((ref) {
  return "Type and Tap on the button below to translate...";
});

final translateToProvider = StateProvider<String>((ref) {
  return "English";
});