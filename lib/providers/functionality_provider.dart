import 'package:flutter/foundation.dart';

class FunctionalityProvider with ChangeNotifier {
  final List<String> _tabs = const ['Pending', 'Accepted', 'Declined'];
  String _selectedTab = '';

  String get selectedTab {
    return _selectedTab;
  }

  List<String> get tabs {
    return _tabs;
  }

  void selectTab(String tab) {
    _selectedTab = tab;
    notifyListeners();
  }
}
