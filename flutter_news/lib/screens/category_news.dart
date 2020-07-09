import 'package:flutter/material.dart';
import 'package:flutter_news/helper/widgets.dart';
import 'package:flutter_news/services/news_service.dart';

class CategoryNews extends StatefulWidget {
  final String newsCategory;

  CategoryNews({this.newsCategory});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  var newsList;
  bool _loading = true;

  void getNews() async {
    NewsForCategory news = NewsForCategory();
    await news.getNewsForCategory(widget.newsCategory);
    newsList = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    getNews();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.purple),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sky ",
              style: TextStyle(color: Colors.black87, fontSize: 25.0, fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.purple, fontSize: 25.0, fontWeight: FontWeight.w600),
            )
          ],
        ),
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.share, color: Colors.purple),
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
            child: Container(
              child: Container(
                margin: EdgeInsets.only(top: 16),
                child: ListView.builder(
                  itemCount: newsList.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return NewsTile(
                      imgUrl: newsList[index].urlToImage ?? "",
                      title: newsList[index].title ?? "",
                      desc: newsList[index].description ?? "",
                      content: newsList[index].content ?? "",
                      postUrl: newsList[index].articleUrl ?? "",
                    );
                  },),
              ),
            ),
          )
    );
  }
}
