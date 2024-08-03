class UserModel {
  final String id;
  final String email;
  final String name;
  final DateTime dateOfBirth;
  final String mobileNumber;
  final String avatar;
  final String address;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.dateOfBirth,
    required this.mobileNumber,
    required this.avatar,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
  });

  // Phương thức từ JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      mobileNumber: json['mobileNumber'],
      avatar: json['avatar'],
      address: json['address'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  // Phương thức tới JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'mobileNumber': mobileNumber,
      'avatar': avatar,
      'address': address,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
