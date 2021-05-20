import 'package:basic_banking_system/model/user.dart';
import 'package:basic_banking_system/screens/select_user.dart';
import 'package:flutter/material.dart';
import '../model/data.dart' as data;

class TransactionPage extends StatefulWidget {
  final User user;

  TransactionPage({this.user});

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  double amount;
  String errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Make a payment',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Enter a amount to be transfer'),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    hintText: 'Enter a Amount',
                    errorText: errorText,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      amount = value == null || value.isEmpty
                          ? 0
                          : double.parse(value);
                    });
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  if (amount == null) {
                    setState(() {
                      errorText = 'Enter a amount';
                    });
                  } else if (amount <= 0) {
                    setState(() {
                      errorText = 'Enter a valid amount';
                    });
                  } else if (amount > widget.user.user_current_balance) {
                    setState(() {
                      errorText =
                          'You have no suffiecient balance to make this transaction';
                    });
                  } else {
                    setState(() {
                      errorText = null;
                    });
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SelectedUser(
                              user: widget.user,
                              amount: amount,
                            )));
                  }
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  child: Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
