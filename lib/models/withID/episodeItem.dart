class EpisodeItem {
  final int number;
  final String title;
  final String airDate;

  EpisodeItem({
    required this.number,
    required this.title,
    required this.airDate,
  });

  factory EpisodeItem.fromJson(Map<String, dynamic> json) {
    return EpisodeItem(
      number: json['number'] ?? 0,
      title: json['title'] ?? '',
      airDate: json['airDate'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'title': title,
      'airDate': airDate,
    };
  }
}
