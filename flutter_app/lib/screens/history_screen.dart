import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final history = ['http://example.com', 'https://phish.com'];

    return Scaffold(
      appBar: AppBar(title: const Text('Scan History')),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) => ListTile(
          leading: const Icon(Icons.link),
          title: Text(history[index]),
        ),
      ),
    );
  }
}
