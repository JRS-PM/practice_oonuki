import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'article.freezed.dart';
part 'article.g.dart';

@freezed
class Article with _$Article {
  factory Article({
    required int code,
    required String title,
    required String body,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}

@riverpod
class ArticleListNotifier extends AutoDisposeNotifier<List<Article>> {
  @override
  List<Article> build() {
    return [];
  }

  void addArticle(Article article) {
    state = [...state, article];
  }

  void removeArticle(int code) {
    state = state.where((article) => article.code != code).toList();
  }

  void updateArticle(Article updatedArticle) {
    state = state
        .map((article) =>
            article.code == updatedArticle.code ? updatedArticle : article)
        .toList();
  }
}
