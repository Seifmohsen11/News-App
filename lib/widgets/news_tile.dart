import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/web_view.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});
  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return WebPage(link: articleModel.link ?? "");
            }));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              articleModel.image ??
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png",
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          articleModel.title ?? "",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          articleModel.subTitle ?? "",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
