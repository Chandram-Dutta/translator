import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaru/yaru.dart';

final lightThemeProvider = StateProvider<ThemeData>((ref) {
  return yaruDark;
});

final darkThemeProvider = StateProvider<ThemeData>((ref) {
  return yaruDark;
});