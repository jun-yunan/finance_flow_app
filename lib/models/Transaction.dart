class TransactionModel {
  String? id;
  final String title;
  final double amount;
  final DateTime date;
  final String category;
  final String transactionType;
  final String userId; // ID của người dùng liên quan
  final String? note;
  final DateTime createdAt;
  final DateTime updatedAt;

  TransactionModel({
    this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    required this.transactionType,
    required this.userId, // Khởi tạo thuộc tính userId
    this.note,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'date': date.toIso8601String(),
      'category': category,
      'transactionType': transactionType,
      'userId': userId, // Thêm userId vào JSON
      'note': note,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      title: json['title'],
      amount: json['amount'],
      date: DateTime.parse(json['date']),
      category: json['category'],
      transactionType: json['transactionType'],
      userId: json['userId'], // Đọc userId từ JSON
      note: json['note'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
