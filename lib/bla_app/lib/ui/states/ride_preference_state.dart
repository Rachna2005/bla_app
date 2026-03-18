import 'package:flutter/material.dart';
import '../../model/ride_pref/ride_pref.dart';
import '../../data/repository/ride_preference/ride_preference_repository.dart';

class RidePreferenceState extends ChangeNotifier {
  final RidePreferenceRepository repo;
  RidePreference? _selectedPreference;
  List<RidePreference> _historyPre = [];
  RidePreferenceState({required this.repo}) {
    _init();
  }

  void _init() {
    _historyPre = repo.allHistory();
  }

  RidePreference? get selectedPreference => _selectedPreference;
  List<RidePreference> get historyPre => _historyPre;

  void selectPreference(RidePreference preference) {
    if (_selectedPreference != preference) {
      _selectedPreference = preference;
      repo.addPreferenceToHistory(preference);
      _historyPre = repo.allHistory();
      notifyListeners();
    }
  }
}
