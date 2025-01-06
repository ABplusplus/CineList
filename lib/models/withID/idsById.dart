class IdsById {
  final int simkl;
  final String slug;
  final String tvdb;
  final String offen;
  final String imdb;
  final String fb;
  final String instagram;
  final String tw;
  final String tvdbslug;
  final int tmdb;
  final String traktslug;

  IdsById({
    required this.simkl,
    required this.slug,
    required this.tvdb,
    required this.offen,
    required this.imdb,
    required this.fb,
    required this.instagram,
    required this.tw,
    required this.tvdbslug,
    required this.tmdb,
    required this.traktslug,
  });

  factory IdsById.fromJson(Map<String, dynamic> json) {
    return IdsById(
      simkl: json['simkl'],
      slug: json['slug'],
      tvdb: json['tvdb'],
      offen: json['offen'],
      imdb: json['imdb'],
      fb: json['fb'],
      instagram: json['instagram'],
      tw: json['tw'],
      tvdbslug: json['tvdbslug'],
      tmdb: json['tmdb'],
      traktslug: json['traktslug'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'simkl': simkl,
      'slug': slug,
      'tvdb': tvdb,
      'offen': offen,
      'imdb': imdb,
      'fb': fb,
      'instagram': instagram,
      'tw': tw,
      'tvdbslug': tvdbslug,
      'tmdb': tmdb,
      'traktslug': traktslug,
    };
  }
}
