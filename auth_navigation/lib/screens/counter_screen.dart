import 'package:flutter/material.dart';

// ═══════════════════════════════════════════════════════════
// PART 1: The Widget class — immutable, stores no state
// ═══════════════════════════════════════════════════════════
class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

// ═══════════════════════════════════════════════════════════
// PART 2: The State class — holds data + logic + build()
// ═══════════════════════════════════════════════════════════
class _CounterScreenState extends State<CounterScreen> {
  // ── State Variables ─────────────────────────────────────
  int _count = 0; // Holds the current counter value.
  String _message = 'Press + to start!'; // Feedback text

  // ── Method 1: Increment ─────────────────────────────────
  void _increment() {
    setState(() {
      _count++;
      _message = 'Going up! 🚀';
    });
  }

  // ── Method 2: Decrement ─────────────────────────────────
  void _decrement() {
    setState(() {
      if (_count > 0) {
        _count--;
        _message = _count == 0 ? 'Cannot go lower!' : 'Going down 📉';
      } else {
        _message = 'Cannot go lower!';
      }
    });
  }

  // ── Method 3: Reset ─────────────────────────────────────
  void _reset() {
    setState(() {
      _count = 0;
      _message = 'Reset! Fresh start 🔄';
    });
  }

  // ── build() ──────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Counter'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _message,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            Text(
              '$_count',
              style: const TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _decrement,
                  child: const Text('−', style: TextStyle(fontSize: 24)),
                ),
                const SizedBox(width: 20),
                OutlinedButton(
                  onPressed: _reset,
                  child: const Text('Reset'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _increment,
                  child: const Text('+', style: TextStyle(fontSize: 24)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
