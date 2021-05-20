import 'package:basic_banking_system/model/user.dart';

var user1 = User(
    user_id: 1,
    user_name: 'Aditya',
    user_email: 'adi@gmail.com',
    user_current_balance: 100);
var user2 = User(
    user_id: 2,
    user_name: 'Kunal',
    user_email: 'kunal@gmail.com',
    user_current_balance: 200);
var user3 = User(
    user_id: 3,
    user_name: 'Vishal',
    user_email: 'vishal@gmail.com',
    user_current_balance: 300);
var user4 = User(
    user_id: 4,
    user_name: 'Ashish',
    user_email: 'ashish@gmail.com',
    user_current_balance: 400);
var user5 = User(
    user_id: 5,
    user_name: 'Rohit',
    user_email: 'rohit@gmail.com',
    user_current_balance: 500);
var user6 = User(
    user_id: 6,
    user_name: 'Shikhar',
    user_email: 'shikhar@gmail.com',
    user_current_balance: 600);
var user7 = User(
    user_id: 7,
    user_name: 'Virat',
    user_email: 'virat@gmail.com',
    user_current_balance: 700);
var user8 = User(
    user_id: 8,
    user_name: 'Hardik',
    user_email: 'hardik@gmail.com',
    user_current_balance: 800);
var user9 = User(
    user_id: 9,
    user_name: 'Kuldeep',
    user_email: 'kuldeep@gmail.com',
    user_current_balance: 900);
var user10 = User(
    user_id: 10,
    user_name: 'Jasprit',
    user_email: 'jasprit@gmail.com',
    user_current_balance: 1000);

List list = [
  user1,
  user2,
  user3,
  user4,
  user5,
  user6,
  user7,
  user8,
  user9,
  user10,
];

Map<String, dynamic> map(User user) {
  return user.toMap();
}
