class UserModel {
  final String id;
  final String email;
  final String name;
  double balance;
  final DateTime dateOfBirth;
  final String mobileNumber;
  final String avatar;
  final String address;
  final DateTime createdAt;
  final DateTime updatedAt;
  List<String> transactionIds;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.balance = 0.0,
    required this.dateOfBirth,
    required this.mobileNumber,
    required this.avatar,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
    this.transactionIds = const [],
  });

  // Phương thức từ JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      balance: (json['balance'] is int)
          ? (json['balance'] as int).toDouble()
          : json['balance'] as double,
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      mobileNumber: json['mobileNumber'],
      avatar: json['avatar'],
      address: json['address'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      transactionIds: (json['transactionIds'] as List<dynamic>)
          .map((item) => item as String)
          .toList(),
    );
  }

  // Phương thức tới JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'balance': balance,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'mobileNumber': mobileNumber,
      'avatar': avatar,
      'address': address,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'transactionIds': transactionIds,
    };
  }
}
