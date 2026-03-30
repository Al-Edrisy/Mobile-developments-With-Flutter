class AuthService {
  // Simulated static users
  static const Map<String, String> _users = {
    'admin': 'admin123',
    'student': 'student123',
  };

  /// Validates user credentials.
  /// Returns true if valid, false otherwise.
  static bool validateUser(String username, String password) {
    if (_users.containsKey(username)) {
      return _users[username] == password;
    }
    return false;
  }
}
