import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rabbit_converter/rabbit_converter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:voa_news/voa/dart_object/dart_object.dart';

class DetailPage extends StatelessWidget {
  NewsItem newsItem;
  DetailPage(this.newsItem);
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(Rabbit.zg2uni(newsItem.title.toString())),
            pinned: true,
            stretch: true,
            expandedHeight: 220,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
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
          ),
          SliverToBoxAdapter(
            child: TextButton(
              onPressed: () async {
                final Uri uri = Uri.parse(newsItem.link.toString());
                if (!await launchUrl(uri)) {
                  throw 'Could not launch $uri';
                }
              },
              child: const Text("https://burmese.voanews.com"),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverToBoxAdapter(
              child: Text("Published Date : ${newsItem.pubDate}"),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverFillRemaining(
              child: Text(Rabbit.zg2uni(newsItem.description.toString())),
            ),
          ),
        ],
      ),
    );
  }
}
