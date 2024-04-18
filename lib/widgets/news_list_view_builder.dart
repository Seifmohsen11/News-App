import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/widgets/news_tile_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});
  final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var Future;
  @override
  void initState() {
    super.initState();
    Future = NewsService().GetTopHeadlines(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: Future,
        builder: (context, snapchot) {
          if (snapchot.hasData) {
            return NewsListView(
              articles: snapchot.data!,
            );
          } else if (snapchot.hasError) {
            return const SliverToBoxAdapter(
              child: Text("oops there was an error,try again later"),
            );
          } else {
            return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          }
        });
  }
}
