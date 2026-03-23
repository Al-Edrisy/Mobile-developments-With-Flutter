# Lab 04: Flutter State Management Concepts

This repository demonstrates the core concepts of state management in Flutter, focusing on local state using `StatefulWidget` and the `setState()` method.

## 🚀 Getting Started

1.  **Initialize Project**: `flutter create lab04_state`
2.  **Run Application**: `flutter run`

## 📚 Concepts Covered

### 1. StatefulWidget vs. StatelessWidget
- **StatelessWidget**: Immutable, used for UI that doesn't change based on data (e.g., icons, labels).
- **StatefulWidget**: Can change over time. It consists of two classes:
    - The **Widget class** (immutable).
    - The **State class** (mutable, holds data and logic).

### 2. The `setState()` Method
Used to notify the framework that the internal state of a widget has changed, triggering a call to the `build()` method to update the UI.
- **Rule**: Always update state variables *inside* the `setState(() { ... })` callback.

### 3. Widget Lifecycle
Understanding when a widget is created, updated, and destroyed.
- `initState()`: Called exactly once when the widget is inserted into the tree. Used for initialization (e.g., setting up timers, controllers).
- `build()`: Called after `initState()` and whenever `setState()` is invoked.
- `dispose()`: Called when the widget is removed from the tree. **Critical** for cleaning up resources (e.g., canceling timers) to avoid memory leaks.

## 🛠 Features

### Part 2 — Counter Screen
- Demonstrates `StatefulWidget` with a simple counter.
- Uses `setState()` to update the count and a feedback message.
- Implements guard conditions (e.g., preventing the counter from going below zero).

### Part 3 — Lifecycle Demo
- Visualizes lifecycle events (`initState`, `build`, `dispose`) in real-time.
- Uses a `Timer` to trigger rebuilds every second.
- Shows the importance of `dispose()` to prevent memory leaks.

### Part 5 — Todo List
- Practical application of local state management.
- Uses `TextEditingController` to handle user input.
- Uses `ListView.builder` to dynamically render a list of tasks.
- Demonstrates complex state updates (adding, toggling, and deleting items).

## 💡 Key Takeaways
- Always call `super.initState()` first in `initState()`.
- Always call `super.dispose()` last in `dispose()`.
- Use `late` for variables initialized in `initState()`.
- Never call `setState()` inside the `build()` method.
