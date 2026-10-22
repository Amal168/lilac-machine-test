class Expese {
  final int? id;
  final String? title;
  final double amount;
  final String? category;
  final String? date;
  final String? descriotion;
  Expese({
  this.id,
  required this.title,
  required this.amount,
  required this.category,
  required this.date,
  this.descriotion = '',
});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'category': category,
      'date': date,
      'descriotion': descriotion
    };
  }

  factory Expese.fromMap(Map<String, dynamic> map) {
    return Expese(
        id: map['id'] as int?,
        title: map['title'] as String,
        amount: (map['amount'] as num).toDouble(),
        category: map['category'] as String,
        date: map['date']as String,
        descriotion: map['descriotion']as String? ?? "",
        );
  }
}
