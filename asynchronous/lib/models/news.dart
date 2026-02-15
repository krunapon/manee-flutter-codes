/// Model class representing the entire news API response
/// Contains status, error info, result count, and list of articles
class News {
  String status;
  String? error;
  int totalResults;
  String trustedPublisher = "al-jazeera-english";
  List<Article> articles;

  News({
    required this.status,
    this.totalResults = 0,
    this.error = "",
    required this.articles,
  });

  /// Factory constructor to create News object from JSON
  /// @param newsJson - The decoded JSON Map from API response
  /// @param trustedPublisher - Optional filter to only get articles from this source
  factory News.fromJson(
    Map<String, dynamic> newsJson, {
    String? trustedPublisher,
  }) => News(
    status: newsJson['status'] ?? '',
    articles: List.from(newsJson['articles'] ?? [])
        .map((article) => Article.fromJson(article))
        .where((article) => article.source.id == trustedPublisher)
        .toList(),
    totalResults: newsJson['totalResults'] ?? 0,
    error: newsJson['error'],
  );
}

/// Model class representing a single news article
/// All fields are final (immutable) after creation
class Article {
  final Source source;
  final String? author;
  final String title;
  final String? description;
  final String? urlToImage;
  final String url;
  final String publishedAt;
  final String? content;

  const Article({
    required this.source,
    this.author,
    required this.title,
    this.description,
    this.urlToImage,
    required this.url,
    required this.publishedAt,
    this.content,
  });

  /// Factory constructor to create Article from JSON
  /// Uses 'as' for type casting with null coalescing for safety
  factory Article.fromJson(Map<String, dynamic> articleJson) => Article(
    source: Source.fromJson(articleJson['source'] ?? {}),
    author: articleJson['author'] as String?,
    title: articleJson['title'] as String? ?? '',
    description: articleJson['description'] as String?,
    urlToImage: articleJson['urlToImage'] as String?,
    url: articleJson['url'] as String? ?? '',
    publishedAt: articleJson['publishedAt'] as String? ?? '',
    content: articleJson['content'] as String?,
  );
}

/// Model class representing the news source
/// Contains ID and name of the publisher
class Source {
  final String? id;
  final String name;

  const Source({this.id, required this.name});

  /// Factory constructor to create Source from JSON
  factory Source.fromJson(Map<String, dynamic> sourceJson) => Source(
    id: sourceJson['id'] as String?,
    name: sourceJson['name'] as String? ?? '',
  );
}
