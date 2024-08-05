class Budget {
  final String categoryId;
  final double limit;
  double spent;

  Budget({
    required this.categoryId,
    required this.limit,
    this.spent = 0.0,
  });

  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'limit': limit,
      'spent': spent,
    };
  }

  factory Budget.fromJson(Map<String, dynamic> json) {
    return Budget(
      categoryId: json['categoryId'],
      limit: json['limit'],
      spent: json['spent'],
    );
  }

  void addExpense(double amount) {
    spent += amount;
  }

  void removeExpense(double amount) {
    spent -= amount;
  }
}
