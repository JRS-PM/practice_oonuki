import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'article.dart';

//コメント
class ArticleListNotifier extends Notifier<List<Article>> {
  @override
  List<Article> build() {
    return [];
  }

  void addArticle(Article article) {
    state = [...state, article];
  }
}

final articleProvider = NotifierProvider<ArticleListNotifier, List<Article>>(
    ArticleListNotifier.new);

class MyArticlePage extends ConsumerWidget {
  const MyArticlePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articles = ref.watch(articleProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('$title ${articles.length}'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 169, 240, 236),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Code: ${article.code}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    article.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    article.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(articleProvider.notifier).addArticle(
                Article(
                    code: articles.length + 1,
                    title: "New Article",
                    body: "Sample body text\nSample body text"),
              );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
