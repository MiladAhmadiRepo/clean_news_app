import '../../domain/entities/article.dart';
import 'source_model.dart';

class ArticleModel extends Article {
  const ArticleModel({
    required int id,
    required SourceModel source,
    required String author,
    required String title,
    required String description,
    required String url,
    required String urlToImage,
    required String publishedAt,
    required String content,
  }) : super(
          id: id,
          source: source,
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    // if (map == null) return null;
    if (map == null) {
      return ArticleModel(
          id: 0,
          source: SourceModel.fromJson({"id": "0", "name": ""}),
          author: "",
          title: "",
          description: "",
          url: "",
          urlToImage: "",
          publishedAt: "",
          content: "");
    }
    return ArticleModel(
      id: int.parse(map['id']??'0' as String),
      source: SourceModel.fromJson(map['source'] as Map<String, dynamic>),
      author: map['author']??""as String,
      title: map['title']??'' as String,
      description: map['description'] ??'',
      url: map['url']??'' as String,
      urlToImage: map['urlToImage'] ??'',
      publishedAt: map['publishedAt']??'' as String,
      content: map['content'] ??''as String,
    );
  }
}
