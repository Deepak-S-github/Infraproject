import 'package:flutter/material.dart';
import '../widgets/score_bar.dart';

class ResultScreen extends StatelessWidget {
  final String url;
  final double score;

  const ResultScreen({super.key, required this.url, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Result')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('URL: $url'),
            const SizedBox(height: 20),
            ScoreBar(score: score),
          ],
        ),
      ),
    );
  }
}
