class Category {
  final String id;
  final String name;
  final bool isIncome; // true nếu là danh mục thu nhập, false nếu là chi tiêu

  Category({
    required this.id,
    required this.name,
    this.isIncome = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'isIncome': isIncome,
    };
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      isIncome: json['isIncome'],
    );
  }
}
