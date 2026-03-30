# Lab 04: Authentication & Navigation

This repository demonstrates core Flutter concepts including state management, simulation-based authentication, and structured navigation.

## 🚀 Features

### 1. Authentication System
- **Static User Repository**: Simulated authentication using `AuthService` with predefined users:
  - `admin` / `admin123`
  - `student` / `student123`
- **Protected Routes**: Navigation to the Home Screen is restricted to authenticated users only.

### 2. Login Screen
- **User Interface**: Clean implementation of two input fields (Username, Password) and a login button.
- **Error Handling**: Real-time validation messages for empty fields or invalid credentials.
- **Session Management**: Automatically removes the Login Screen from the navigation stack upon successful authentication.

### 3. Home Screen & State Management
- **Local State**: Demonstrates `setState()` and `StatefulWidget` for dynamic UI updates.
- **Navigation Controls**: Prevents accidental exit with a logout confirmation dialog when pressing the system back button.
- **Module Access**: Provides entry points to specific lab parts:
  - Part 2: Counter Screen
  - Part 3: Lifecycle Demo
  - Part 5: Todo List

### 4. Custom 404 Screen
- **NotFoundScreen**: A dedicated page for non-existent routes or error simulation, accessible via the "404" button on the Home Screen.

## 🧠 Concepts Covered

### Widget Lifecycle
- `initState()`: Resource initialization.
- `build()`: UI rendering and rebuild trigger.
- `dispose()`: Memory management and resource cleanup.

### Navigation Patterns
- `Navigator.push()`: Standard stack navigation.
- `Navigator.pushReplacement()`: Session-style navigation (replaces current screen).
- `PopScope`: Intercepting system-level back button events.

## 🛠️ Getting Started

1.  **Dependencies**: `flutter pub get`
2.  **Run Application**: `flutter run`

---
*Developed for the Mobile Development With Flutter Course.*
