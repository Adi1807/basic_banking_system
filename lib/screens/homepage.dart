import 'package:basic_banking_system/model/database.dart';
import 'package:basic_banking_system/model/user.dart';
import 'package:basic_banking_system/screens/transaction.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/data.dart' as data;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTile;

  Widget myListTile(BuildContext context, User user) {
    return ListTile(
      leading: Text(data.map(user)['user_id'].toString()),
      title: Text(data.map(user)['user_name'].toString()),
      subtitle: Text(data.map(user)['user_email'].toString()),
      trailing: Text(data.map(user)['user_current_balance'].toString()),
      onTap: () {
        setState(() {
          selectedTile = data.map(user)['user_id'];
        });

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TransactionPage(
              user: user,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: MyDatabase().getDataFromDatabase(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return snapshot.data.length == null
                      ? Container()
                      : myListTile(context, snapshot.data[index]);
                },
                itemCount: snapshot.data.length == null
                    ? 0
                    : snapshot.data.length, //data.list.length,
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
