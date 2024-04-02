import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'teladelogin2.dart';

void rodarLogin() async {
  await _initHive();
  runApp(const TelaDeLogin());
}

Future<void> _initHive() async {
  await Hive.initFlutter();
  await Hive.openBox("login");
  await Hive.openBox("accounts");
}
