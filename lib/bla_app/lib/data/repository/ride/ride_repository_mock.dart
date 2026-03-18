import 'ride_repository.dart';
import '../../../model/ride/ride.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../dummy_data.dart';

class RideRepositoryMock extends RideRepository {
  final List<Ride> _ride = fakeRides;
  @override
  List<Ride> allRide() {
    return _ride;
  }

  @override
List<Ride> getRidesFor(RidePreference preferences)  {
    return _ride
        .where(
          (ride) =>
              ride.departureLocation == preferences.departure &&
              ride.arrivalLocation == preferences.arrival &&
              ride.availableSeats >= preferences.requestedSeats,
        )
        .toList();
  }
}
