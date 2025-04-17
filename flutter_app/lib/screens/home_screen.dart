import 'package:flutter/material.dart';
import '../widgets/scan_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PhishDetector')),
      body: const Center(
        child: ScanCard(),
      ),
    );
  }
}
