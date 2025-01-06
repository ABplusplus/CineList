class Trailer {
  final String title;
  final String url;

  Trailer({
    required this.title,
    required this.url,
  });

  factory Trailer.fromJson(Map<String, dynamic> json) {
    return Trailer(
      title: json['title'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'url': url,
    };
  }
}
