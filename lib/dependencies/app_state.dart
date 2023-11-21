import 'package:flutter/widgets.dart';
import 'package:payment_exploration/utils/app_states.dart';

class AppStateProvider with ChangeNotifier {
  AppStates _state = AppStates.loggedin;
  set setState(AppStates st) {
    _state = st;
    notifyListeners();
  }

  AppStates get state => _state;
}
