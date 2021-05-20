import 'package:basic_banking_system/model/data.dart';
import 'package:basic_banking_system/model/database.dart';
import 'package:basic_banking_system/model/user.dart';
import 'package:basic_banking_system/screens/homepage.dart';
import 'package:flutter/material.dart';
import './model/data.dart' as data;
import './screens/transaction.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MyDatabase().initialize();
  await MyDatabase().insertUserData(data.list);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
