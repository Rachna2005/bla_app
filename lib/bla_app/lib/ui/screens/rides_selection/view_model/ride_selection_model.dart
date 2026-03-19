import 'package:flutter/material.dart';
import '../../../../model/ride/ride.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../../data/repository/ride/ride_repository.dart';
import '../../../states/ride_preference_state.dart';

class RideSelectionModel extends ChangeNotifier {
  final RidePreferenceState preferenceState;
  final RideRepository rideRepository;
  RideSelectionModel({
    required this.preferenceState,
    required this.rideRepository,
  }) {
    preferenceState.addListener(onPreferenceChange);
  }

  void onPreferenceChange() {
    notifyListeners();
  }

  RidePreference? get selectedPreference => preferenceState.selectedPreference;

  List<Ride> matchingRide() {
    final pref = selectedPreference;
    if (pref == null) return [];

    return rideRepository.allRide().where((ride) {
      return ride.departureLocation == pref.departure &&
          ride.arrivalLocation == pref.arrival &&
          ride.availableSeats >= pref.requestedSeats;
    }).toList();
  }

  void selectPreference(RidePreference pref) {
    preferenceState.selectPreference(pref);
  }

  @override
  void dispose() {
    preferenceState.removeListener(onPreferenceChange);
    super.dispose();
  }
}
