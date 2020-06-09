import 'package:flutter/material.dart';

import '../change_local_izations.dart';
import 'article_page.dart';

final List<Map> articles = [
  {
    "title": "How to Seem Like You Always Have Your Shot Together",
    "author": "Jonhy Vino",
    "time": "4 min read",
  },
  {
    "title": "Does Dry is January Actually Improve Your Health?",
    "author": "Jonhy Vino",
    "time": "4 min read",
  },
  {
    "title": "You do hire a designer to make something. You hire them.",
    "author": "Jonhy Vino",
    "time": "4 min read",
  },
  {
    "title": "How to Seem Like You Always Have Your Shot Together",
    "author": "Jonhy Vino",
    "time": "4 min read",
  },
  {
    "title": "How to Seem Like You Always Have Your Shot Together",
    "author": "Jonhy Vino",
    "time": "4 min read",
  },
  {
    "title": "Does Dry is January Actually Improve Your Health?",
    "author": "Jonhy Vino",
    "time": "4 min read",
  },
  {
    "title": "You do hire a designer to make something. You hire them.",
    "author": "Jonhy Vino",
    "time": "4 min read",
  },
  {
    "title": "How to Seem Like You Always Have Your Shot Together",
    "author": "Jonhy Vino",
    "time": "4 min read",
  },
];

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeLocalizationsStatus(
      child: InfoDetailPage(),
    );
  }
}

class InfoDetailPage extends StatelessWidget {
  final Color primaryColor = Color(0xffFD6592);
  final Color bgColor = Color(0xff6B8E23);
  final Color secondaryColor = Color(0xff324558);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 1,
      child: Scaffold(
        backgroundColor: Color(0xFFc343a49),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Basic knowledge'),
          leading: Icon(Icons.category),
          backgroundColor:  Color(0xFF7273f7),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            ListView.separated(
              padding: const EdgeInsets.all(16.0),
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return _buildArticleItem(index, context);
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 16.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArticleItem(int index, context) {
    Map article = articles[index];
    final String sample =
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1583256478898&di=d7ec8bcaa8536963c5a9b5fcfe7fb96f&imgtype=0&src=http%3A%2F%2Fphoto.16pic.com%2F00%2F37%2F47%2F16pic_3747434_b.jpg';
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Container(
            width: 70,
            height: 80,
            color: bgColor,
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(9.0),
            margin: const EdgeInsets.all(9.0),
            child: Row(
              children: <Widget>[
//                Container(
//                  height: 100,
//                  color: Colors.blue,
//                  width: 80.0,
//                  child: PNetworkImage(
//                    sample,
//                    fit: BoxFit.cover,
//                  ),
//                ),
                const SizedBox(width: 20.0),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ArticlePage()))
                        },
                        child: Text(
                          article["title"],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: secondaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            WidgetSpan(
                              child: CircleAvatar(
                                radius: 15.0,
                                backgroundColor: primaryColor,
                              ),
                            ),
                            WidgetSpan(
                              child: const SizedBox(width: 5.0),
                            ),
                            TextSpan(
                                text: article["author"],
                                style: TextStyle(fontSize: 16.0)),
                            WidgetSpan(
                              child: const SizedBox(width: 20.0),
                            ),
                            WidgetSpan(
                              child: const SizedBox(width: 5.0),
                            ),
                            TextSpan(
                              text: article["time"],
                            ),
                          ],
                        ),
                        style: TextStyle(height: 2.0),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
