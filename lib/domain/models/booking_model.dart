class BookingModel {
  final String id;
  final String userId;

  BookingModel({
    required this.id,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
    };
  }

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'],
      userId: json['userId'],
    );
  }
}
