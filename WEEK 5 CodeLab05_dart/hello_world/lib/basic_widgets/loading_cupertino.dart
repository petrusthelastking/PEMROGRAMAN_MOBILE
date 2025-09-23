import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoDemoPage extends StatefulWidget {
  const CupertinoDemoPage({super.key});

  @override
  State<CupertinoDemoPage> createState() => _CupertinoDemoPageState();
}

class _CupertinoDemoPageState extends State<CupertinoDemoPage> {
  bool _loading = false;

  Future<void> _runFakeTask() async {
    setState(() => _loading = true);
    await Future.delayed(const Duration(seconds: 2)); // simulasi proses
    if (!mounted) return;
    setState(() => _loading = false);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Selesai!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cupertino Button & Loading')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // --- Cupertino Buttons ---
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  onPressed: _loading ? null : _runFakeTask,
                  child: const Text('Cupertino'),
                ),
                const SizedBox(width: 12),
                CupertinoButton.filled(
                  onPressed: _loading ? null : _runFakeTask,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: const Text('Filled'),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // --- Loading Indicators ---
            if (_loading) ...[
              const Text('Loading...'),
              const SizedBox(height: 12),
              const CupertinoActivityIndicator(), // iOS-style spinner
              const SizedBox(height: 12),
              const CircularProgressIndicator(),   // Material spinner
              const SizedBox(height: 12),
              const LinearProgressIndicator(),     // Material "loading bar"
            ],
          ],
        ),
      ),
    );
  }
}
