// Scan Card Widget 
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../screens/result_screen.dart';

class ScanCard extends StatefulWidget {
  const ScanCard({super.key});

  @override
  State<ScanCard> createState() => _ScanCardState();
}

class _ScanCardState extends State<ScanCard> {
  final TextEditingController _urlController = TextEditingController();
  bool _isLoading = false;

  void _scanUrl() async {
    final url = _urlController.text.trim();
    if (url.isEmpty) return;

    setState(() => _isLoading = true);

    try {
      final result = await ApiService.scanUrl(url);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(
            url: url,
            score: result['score'] ?? 0.0,
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error scanning URL')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Enter a URL to scan',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _urlController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'https://example.com',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _isLoading ? null : _scanUrl,
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Scan'),
            ),
          ],
        ),
      ),
    );
  }
}
