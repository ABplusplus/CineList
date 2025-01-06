class RatingsById {
  final double simkl;
  final int imdb;
  final int trakt;

  RatingsById({
    required this.simkl,
    required this.imdb,
    required this.trakt,
  });

  factory RatingsById.fromJson(Map<String, dynamic> json) {
    return RatingsById(
      simkl: json['simkl']?.toDouble() ?? 0.0,
      imdb: json['imdb'] ?? 0,
      trakt: json['trakt'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'simkl': simkl,
      'imdb': imdb,
      'trakt': trakt,
    };
  }
}
