import 'package:flutter/material.dart';

// ── Model class: represents a single to-do item ─────────────
class TodoItem {
  String text;
  bool isDone;
  TodoItem({required this.text, this.isDone = false});
}

// ── StatefulWidget ────────────────────────────────────────────
class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  // ── State variables ──────────────────────────────────────────
  final List<TodoItem> _todos = [];
  late TextEditingController _controller;

  // ── initState: called ONCE — set up the controller ───────────
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  // ── dispose: called ONCE — clean up the controller ───────────
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // ── Add a new task ────────────────────────────────────────────
  void _addTodo() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      _todos.add(TodoItem(text: _controller.text.trim()));
      _controller.clear();
    });
  }

  // ── Toggle done/not-done on tap ──────────────────────────────
  void _toggleDone(int index) {
    setState(() {
      _todos[index].isDone = !_todos[index].isDone;
    });
  }

  // ── Computed property: how many tasks are not done? ───────────
  int get _remaining => _todos.where((item) => !item.isDone).length;

  // ── build() ────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do · $_remaining remaining'),
      ),
      body: Column(
        children: [
          // ── Input row: text field + add button ────────────────
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Add a task...',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _addTodo(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addTodo,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          // ── Task list ─────────────────────────────────────────
          Expanded(
            child: _todos.isEmpty
                ? const Center(child: Text('No tasks yet! Add one above.'))
                : ListView.builder(
                    itemCount: _todos.length,
                    itemBuilder: (context, index) {
                      final item = _todos[index];
                      return ListTile(
                        leading: Checkbox(
                          value: item.isDone,
                          onChanged: (_) => _toggleDone(index),
                        ),
                        title: Text(
                          item.text,
                          style: TextStyle(
                            decoration: item.isDone
                                ? TextDecoration.lineThrough
                                : null,
                            color: item.isDone ? Colors.grey : Colors.black87,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline, color: Colors.red),
                          onPressed: () => setState(() => _todos.removeAt(index)),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
