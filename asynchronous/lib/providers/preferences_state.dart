import 'package:flutter/material.dart';

class PreferencesState extends ChangeNotifier {
  String _language = 'English';
  String _textSize = 'Medium';
  bool _notifications = true;

  String get language => _language;
  String get textSize => _textSize;
  bool get notifications => _notifications;

  void setLanguage(String value) {
    _language = value;
    notifyListeners();
  }

  void setTextSize(String value) {
    _textSize = value;
    notifyListeners();
  }

  void toggleNotifications(bool value) {
    _notifications = value;
    notifyListeners();
  }
}
