class UserRecommendation {
  final String title;
  final String slug;

  UserRecommendation({
    required this.title,
    required this.slug,
  });

  factory UserRecommendation.fromJson(Map<String, dynamic> json) {
    return UserRecommendation(
      title: json['title'],
      slug: json['slug'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'slug': slug,
    };
  }
}
