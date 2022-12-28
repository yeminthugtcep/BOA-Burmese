import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rabbit_converter/rabbit_converter.dart';
import 'package:voa_news/voa/dart_object/dart_object.dart';
import 'package:voa_news/voa/show_ui/detail/detail.dart';

class NewsWidget extends StatelessWidget {
  NewsItem newsItem;
  NewsWidget(this.newsItem);
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return DetailPage(newsItem);
          }));
        },
        leading: SizedBox(
          height: 100,
          width: 100,
          child: Hero(
            tag: newsItem.enclosure!.link.toString(),
            child: CachedNetworkImage(
              imageUrl: newsItem.enclosure!.link.toString(),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        title: Text(
          Rabbit.zg2uni(newsItem.title.toString()),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        subtitle: Text(Rabbit.zg2uni(newsItem.pubDate.toString())),
      ),
    );
  }
}
