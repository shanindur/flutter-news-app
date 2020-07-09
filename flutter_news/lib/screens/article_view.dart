import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String postUrl;
  ArticleView({@required this.postUrl});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.share, color: Colors.purple,),
          )
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.purple),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.postUrl,
          onWebViewCreated: (WebViewController webViewController){
            _controller.complete(webViewController);
          },
        ),
      ),
    );
  }
}
