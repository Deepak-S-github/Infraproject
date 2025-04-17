import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<dynamic> news = [];

  @override
  void initState() {
    super.initState();
    loadNews();
  }

  Future<void> loadNews() async {
    final String response = await rootBundle.loadString('assets/news_dummy.json');
    setState(() {
      news = json.decode(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cybersecurity News')),
      body: ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(news[index]['title'] ?? ''),
          subtitle: Text(news[index]['description'] ?? ''),
        ),
      ),
    );
  }
}
