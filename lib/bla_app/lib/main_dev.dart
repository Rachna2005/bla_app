import 'package:provider/provider.dart';

import 'main.dart';
import 'data/repository/location/location_repository.dart';
import 'data/repository/location/location_reository_mock.dart';
import 'data/repository/ride/ride_repository.dart';
import 'data/repository/ride/ride_repository_mock.dart';
import 'data/repository/ride_preference/ride_preference_repository.dart';
import 'data/repository/ride_preference/ride_preference_repository_mock.dart';

List<InheritedProvider> get devProviders {
  return [
    Provider<LocationRepository>(create: (_) => LocationRepositoryMock()),
    Provider<RideRepository>(create: (_) => RideRepositoryMock()),
    Provider<RidePreferenceRepository>(
      create: (_) => RidePreferenceRepositoryMock(),
    ),
  ];
}

void main() {
  mainBla(devProviders);
}

