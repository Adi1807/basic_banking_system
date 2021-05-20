class User {
  int user_id;
  String user_name;
  String user_email;
  double user_current_balance;

  User(
      {this.user_current_balance,
      this.user_email,
      this.user_id,
      this.user_name});

  Map<String, dynamic> toMap() {
    return {
      'user_id': user_id,
      'user_name': user_name,
      'user_email': user_email,
      'user_current_balance': user_current_balance,
    };
  }
}
