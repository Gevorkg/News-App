import 'dart:convert';

class PostDataUiModel {
  final String articleId; 
  final String title;
  final Uri link; 
  final List<String> keywords; 
  final List<String> creators; 
  final String? description;
  final String? content; 
  final DateTime pubDate; 
  final Uri? imageUrl; 
  final String sourceId; 
  final String sourceName;
  final Uri sourceUrl;
  final Uri? sourceIcon; 
  final String language; 
  final List<String> country; 
  final List<String> category; 
  final String sentiment; 
  final Map<String, double> sentimentStats; 
  final bool duplicate;

  PostDataUiModel({
    required this.articleId,
    required this.title,
    required this.link,
    required this.keywords,
    required this.creators,
    this.description,
    this.content,
    required this.pubDate,
    this.imageUrl,
    required this.sourceId,
    required this.sourceName,
    required this.sourceUrl,
    this.sourceIcon,
    required this.language,
    required this.country,
    required this.category,
    required this.sentiment,
    required this.sentimentStats,
    required this.duplicate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'articleId': articleId,
      'title': title,
      'link': link.toString(),
      'keywords': keywords,
      'creators': creators,
      'description': description,
      'content': content,
      'pubDate': pubDate.toIso8601String(),
      'imageUrl': imageUrl?.toString(),
      'sourceId': sourceId,
      'sourceName': sourceName,
      'sourceUrl': sourceUrl.toString(),
      'sourceIcon': sourceIcon?.toString(),
      'language': language,
      'country': country,
      'category': category,
      'sentiment': sentiment,
      'sentimentStats': sentimentStats,
      'duplicate': duplicate,
    };
  }

  factory PostDataUiModel.fromMap(Map<String, dynamic> map) {
    return PostDataUiModel(
      articleId: map['articleId'] as String? ?? '',
      title: map['title'] as String? ?? '',
      link: Uri.parse(map['link'] as String? ?? ''),
      keywords: List<String>.from(map['keywords'] as List? ?? []),
      creators: List<String>.from(map['creators'] as List? ?? []),
      description: map['description'] as String?,
      content: map['content'] as String?,
      pubDate: DateTime.tryParse(map['pubDate'] as String? ?? '') ?? DateTime.now(),
      imageUrl: map['image_url'] != null ? Uri.parse(map['image_url'] as String) : null,
      sourceId: map['sourceId'] as String? ?? '',
      sourceName: map['source_name'] as String? ?? '',
      sourceUrl: Uri.parse(map['sourceUrl'] as String? ?? ''),
      sourceIcon: map['sourceIcon'] != null ? Uri.parse(map['sourceIcon'] as String) : null,
      language: map['language'] as String? ?? '',
      country: List<String>.from(map['country'] as List? ?? []),
      category: List<String>.from(map['category'] as List? ?? []),
      sentiment: map['sentiment'] as String? ?? '',
      sentimentStats: Map<String, double>.from(map['sentimentStats'] as Map? ?? {}),
      duplicate: map['duplicate'] as bool? ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostDataUiModel.fromJson(String source) =>
      PostDataUiModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostDataUiModel(articleId: $articleId, title: $title, link: $link, keywords: $keywords, creators: $creators, description: $description, content: $content, pubDate: $pubDate, imageUrl: $imageUrl, sourceId: $sourceId, sourceName: $sourceName, sourceUrl: $sourceUrl, sourceIcon: $sourceIcon, language: $language, country: $country, category: $category, sentiment: $sentiment, sentimentStats: $sentimentStats, duplicate: $duplicate)';
  }
}
