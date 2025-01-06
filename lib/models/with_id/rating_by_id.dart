class RatingById {
  final double value;
  final int votes;

  RatingById({
    required this.value,
    required this.votes,
  });

  factory RatingById.fromJson(Map<String, dynamic> json) {
    return RatingById(
      value: (json['value'] ?? 0.0).toDouble(),
      votes: json['votes'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'votes': votes,
    };
  }
}
