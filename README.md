# 📱 Mobile Development With Flutter

Welcome to the collection of Flutter projects exploring modern mobile architecture, design patterns, and innovative UI concepts.

This repository serves as a comprehensive lab for modeling different architectural approaches to mobile development, helping to discover the most efficient and scalable ways to build cross-platform applications.

## 🏗️ Repository Structure

Each folder in this repository represents a standalone Flutter project with a unique concept, architectural design, and implementation goal.

| Project Name | Architecture / Concept | Description |
| :--- | :--- | :--- |
| **[Auth & Navigation](./auth_navigation)** | Authentication & Structured Navigation | A project implementing login simulation, protected routing, and custom error handling. |

## 🚀 Key Learning Objectives

- **Architecture Modeling**: Comparing different designs like BLoC, Provider, MVVM, and Clean Architecture.
- **Modern UI/UX**: Implementing sleek, responsive, and interactive designs.
- **State Management**: Mastering various state management solutions in the Flutter ecosystem.
- **Modular Development**: Maintaining a mono-repo structure where each project is independent yet organized.

## 🛠️ How to run a project

1. Navigate to the desired project folder:
   ```bash
   cd "Folder Name"
   ```
2. Fetch dependencies:
   ```bash
   flutter pub get
   ```
3. Run the application:

   flutter run
   ```
   on mobile device or emulator
   ```bash
   xcrun simctl boot 11391206-C502-4766-B116-65D47FCB1FE3 && open -a Simulator
   flutter devices
   xcrun simctl list devices | grep "Booted"
   flutter run -d 11391206-C502-4766-B116-65D47FCB1FE3
   ```
---
*Flutter Development Course.*
