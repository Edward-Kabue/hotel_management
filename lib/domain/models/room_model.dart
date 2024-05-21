class Room {
  final String type;
  final num rate;
  final bool isAvailable;

  Room({
    required this.type,
    required this.rate,
    required this.isAvailable,
  });
  //serialize to JSON
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'rate': rate,
      'isAvailable': isAvailable,
    };
  }

  //deserialize to data
  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      type: json['type'],
      rate: json['rate'],
      isAvailable: json['isAvailable'],
    );
  }
}
