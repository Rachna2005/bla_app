import 'package:flutter/material.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../states/ride_preference_state.dart';

class HomeViewModel extends ChangeNotifier {
  final RidePreferenceState preferenceState;
  HomeViewModel({required this.preferenceState}) {
    preferenceState.addListener(onPreferenceChange);
  }

  void onPreferenceChange() {
    notifyListeners();
  }

  RidePreference? get selectedPreference => preferenceState.selectedPreference;

  List<RidePreference> get history =>
      preferenceState.historyPre.reversed.toList();

  void selectPreference(RidePreference pref) {
    preferenceState.selectPreference(pref);
  }

  @override
  void dispose() {
    preferenceState.removeListener(onPreferenceChange);
    super.dispose();
  }
}
