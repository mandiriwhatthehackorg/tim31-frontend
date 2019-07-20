class History {
  String title;
  String user;
  String date;
  String amount;
  bool isOut;

  History({this.user, this.title, this.date, this.amount, this.isOut});

  factory History.fromJson(Map<String, dynamic> parsedJson) {

    return History (
      user: parsedJson["username"],
      title: parsedJson['name'],
      date: parsedJson['created_at'],
      amount: parsedJson['amount'].toString(),
      isOut: parsedJson['is_out'] == 0 ? false : true,
    );
  }
}