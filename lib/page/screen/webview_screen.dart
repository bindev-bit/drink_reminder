import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewScreen extends StatefulWidget {
  String title, url;
  WebViewScreen({this.title, this.url});
  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      withJavascript: true,
      initialChild: Center(
        child: CircularProgressIndicator(),
      ),
      withZoom: true,
      resizeToAvoidBottomInset: true,
      supportMultipleWindows: true,
      appBar: AppBar(
        title: Text(
          widget.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: false,
      ),
      url: widget.url,
    );
  }
}
