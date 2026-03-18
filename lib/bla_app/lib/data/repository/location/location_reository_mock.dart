import 'package:flutter/material.dart';

import 'location_repository.dart';
import '../../../model/ride/locations.dart';
import '../../dummy_data.dart';

class LocationRepositoryMock extends LocationRepository {
  final List<Location> _location = fakeLocations;
  @override
  List<Location> allLocation()  {
    return _location;
  }
}
