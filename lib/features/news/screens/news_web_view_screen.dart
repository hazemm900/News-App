import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/core/base_widgets/custom_app_bar.dart';
import 'package:news_app/core/theme/color.dart';
import 'package:news_app/features/news/data/model/news_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebViewScreen extends StatefulWidget {
  final String url;

  const NewsWebViewScreen({
    super.key,
    required this.url,
  });

  @override
  State<NewsWebViewScreen> createState() => _NewsWebViewScreenState();
}

class _NewsWebViewScreenState extends State<NewsWebViewScreen> {
  var loadingPercentage = 0;
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the WebViewController with settings
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
      ..loadRequest(Uri.parse(widget.url ?? ""));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        appBarTitle: 'Articles',
      ),
      body: Stack(
        children: [
          WebViewWidget(
            controller: controller,
          ),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
              color: MyColors.myRed,
            ),
        ],
      ),
    );
  }
}
