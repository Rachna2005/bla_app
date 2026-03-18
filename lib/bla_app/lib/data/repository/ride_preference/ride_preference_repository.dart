import '../../../model/ride_pref/ride_pref.dart';

abstract class RidePreferenceRepository {
List<RidePreference> allHistory();
  void addPreferenceToHistory(RidePreference preference);
}

