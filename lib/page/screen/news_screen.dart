import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_reminder/component/const.dart';
import 'package:water_reminder/component/custom_navbar.dart';
import 'package:water_reminder/helper/model/news_model.dart';
import 'package:http/http.dart' as http;
import 'package:water_reminder/page/screen/webview_screen.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  var url =
      "https://newsapi.org/v2/everything?q=kesehatan%20minum&sortBy=publishedAt&apiKey=97fb428247ec44da905fefd97429ed2a";

  Future<News> getNews() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      News news = News.fromJson(json);

      return news;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomNavbar(),
          FutureBuilder<News>(
            future: getNews(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return LinearProgressIndicator();
              else {
                return Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Text(
                            "Daily Healthy",
                            style: TextStyle(
                              color: secondary,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ...snapshot.data.news.map((e) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: ExpansionTile(
                                title: Text(
                                  e.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: secondary,
                                  ),
                                ),
                                leading: e.urlToImage != null
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Image.network(
                                            e.urlToImage,
                                          ),
                                        ),
                                      )
                                    : Icon(Icons.image_not_supported),
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          e.description,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                          onTap: () => Get.to(
                                            WebViewScreen(
                                              url: e.url,
                                              title: e.title,
                                            ),
                                            transition: Transition.downToUp,
                                            duration:
                                                Duration(milliseconds: 800),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Icon(Icons.open_in_new),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "Lainnya",
                                                  style: TextStyle(
                                                      color: Colors.blue),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
