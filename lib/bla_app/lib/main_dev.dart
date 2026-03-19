import 'package:provider/provider.dart';

import 'main.dart';
import 'data/repository/location/location_repository.dart';
import 'data/repository/location/location_repository_mock.dart';
import 'data/repository/ride/ride_repository.dart';
import 'data/repository/ride/ride_repository_mock.dart';
import 'data/repository/ride_preference/ride_preference_repository.dart';
import 'data/repository/ride_preference/ride_preference_repository_mock.dart';
import 'ui/states/ride_preference_state.dart';

List<InheritedProvider> get devProviders {
  RidePreferenceRepository ridePreferenceRepository =
      RidePreferenceRepositoryMock();
  return [
    Provider<LocationRepository>(create: (_) => LocationRepositoryMock()),
    Provider<RideRepository>(create: (_) => RideRepositoryMock()),
    ChangeNotifierProvider<RidePreferenceState>(
      create: (_) => RidePreferenceState(repo: ridePreferenceRepository),
    ),
  ];
}

void main() {
  mainBla(devProviders);
}
