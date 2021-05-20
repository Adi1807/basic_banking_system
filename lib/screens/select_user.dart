import 'package:basic_banking_system/model/database.dart';
import 'package:basic_banking_system/model/user.dart';
import 'package:basic_banking_system/screens/homepage.dart';
import 'package:flutter/material.dart';

import '../model/data.dart' as data;

class SelectedUser extends StatefulWidget {
  final User user;
  final double amount;

  SelectedUser({this.user, this.amount});

  @override
  _SelectedUserState createState() => _SelectedUserState();
}

class _SelectedUserState extends State<SelectedUser> {
  int selectedTile;

  Widget myListTile(BuildContext context, User user) {
    return ListTile(
      leading: Text(data.map(user)['user_id'].toString()),
      title: Text(data.map(user)['user_name'].toString()),
      subtitle: Text(data.map(user)['user_email'].toString()),
      trailing: Text(data.map(user)['user_current_balance'].toString()),
      onTap: () async {
        setState(() {
          selectedTile = data.map(user)['user_id'];
        });
        widget.user.user_current_balance -= widget.amount;
        user.user_current_balance += widget.amount;
        await MyDatabase().updateUserData(widget.user);
        await MyDatabase().updateUserData(user);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomePage()),
            (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.amount);
    return Scaffold(
      appBar: AppBar(
        title: Text('Select user to send money'),
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
                      : snapshot.data[index].user_id == widget.user.user_id
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
