import '../../../model/ride_pref/ride_pref.dart';
import 'ride_preference_repository.dart';
import '../../dummy_data.dart';

class RidePreferenceRepositoryMock extends RidePreferenceRepository {
  final List<RidePreference> _history = fakeRidePrefs;
  @override
  List<RidePreference> allHistory() {
    return _history;
  }

  @override
  void addPreferenceToHistory(RidePreference preference) {
    _history.add(preference);
  }
}
