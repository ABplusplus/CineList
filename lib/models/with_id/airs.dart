class Airs {
  final String day;
  final String time;
  final String timezone;

  Airs({
    required this.day,
    required this.time,
    required this.timezone,
  });

  factory Airs.fromJson(Map<String, dynamic> json) {
    return Airs(
      day: json['day'] ?? '',
      time: json['time'] ?? '',
      timezone: json['timezone'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'time': time,
      'timezone': timezone,
    };
  }
}
