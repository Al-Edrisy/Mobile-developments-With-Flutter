# Flutter Posts App

A simple Flutter application that fetches posts from a REST API and displays them in a list with detail views.

## Features

- **List of Posts**: Fetches a list of posts from [JSONPlaceholder](https://jsonplaceholder.typicode.com/).
- **Post Details**: View full content of each post by tapping on a list item.
- **Service Layer**: Decoupled service for API interaction.
- **Model-driven**: Uses a Post model for type safety.

## Project Structure

```text
lib/
├── main.dart           # App entry point and theme configuration
├── models/
│   └── post.dart       # Post data model
├── screens/
│   ├── home_screen.dart        # Main list view
│   └── post_detail_screen.dart # Detailed view for a single post
└── services/
    └── post_service.dart     # API service for fetching posts
```

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed.
- A mobile emulator or physical device.

### Running the App

1. Clone or open the project.
2. Ensure dependencies are installed:
   ```bash
   flutter pub get
   ```
3. Run the application:
   ```bash
   flutter run
   ```

## Dependencies

- `http`: For making network requests.
- `cupertino_icons`: For iOS-style icons.
