import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final TextEditingController _controller = TextEditingController();

  void _submitReport() {
    final String url = _controller.text;
    // TODO: Send report to API
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Reported: $url')),
    );
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Report Site')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Enter suspicious URL'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _submitReport,
              child: const Text('Report'),
            ),
          ],
        ),
      ),
    );
  }
}
