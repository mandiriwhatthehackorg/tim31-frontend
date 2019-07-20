class GroupCardData {
  String name;
  String currentBalance;
  String targetBalance;
  String percentage;
  String remainingDay;

  GroupCardData({
    this.name,
    this.currentBalance,
    this.targetBalance,
    this.percentage,
    this.remainingDay
  });

  factory GroupCardData.fromJson(Map<String, dynamic> parsedJson) {
    return GroupCardData(
      name: parsedJson["name"],
      currentBalance: parsedJson["current_balance"].toString(),
      targetBalance: parsedJson["target_amount"].toString(),
      percentage: parsedJson["percentage"].toString(),
      remainingDay: parsedJson["remaining_day"]
    );
  }
}