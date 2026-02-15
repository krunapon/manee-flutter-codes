import 'package:flutter/material.dart';
import '../models/news.dart';

/// Widget to display a single news article in the list
/// StatelessWidget because it doesn't manage its own state
class ListItem extends StatelessWidget {
  final Article article;

  const ListItem(this.article, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use article image URL if available, otherwise use placeholder
    String imagePath =
        article.urlToImage ??
        "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png";
    return Row(
      children: <Widget>[
        SizedBox(
          height: 80,
          width: 100,
          child: Image.network(
            imagePath,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.broken_image);
            },
            loadingBuilder: (context, child, progress) {
              return progress == null
                  ? child
                  : const CircularProgressIndicator();
            },
          ),
        ),
        // Article title and description
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  article.title,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  article.description ?? "",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
