// Score Bar Widget 
import 'package:flutter/material.dart';

class ScoreBar extends StatelessWidget {
  final double score; // e.g., 0.0 (phishing) to 1.0 (safe)

  const ScoreBar({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    Color getColor() {
      if (score >= 0.7) return Colors.green;
      if (score >= 0.4) return Colors.orange;
      return Colors.red;
    }

    return Column(
      children: [
        Text('Trust Score: ${(score * 100).toInt()}%'),
        const SizedBox(height: 10),
        LinearProgressIndicator(
          value: score,
          backgroundColor: Colors.grey.shade300,
          color: getColor(),
          minHeight: 15,
        ),
      ],
    );
  }
}
