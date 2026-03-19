import 'package:flutter/material.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../../utils/animations_util.dart' show AnimationUtils;
import '../../../theme/theme.dart';
import '../widgets/ride_preference_modal.dart';
import '../widgets/rides_selection_header.dart';
import '../widgets/rides_selection_tile.dart';
import '../view_model/ride_selection_model.dart';

class RidesSelectionContent extends StatelessWidget {
  final RideSelectionModel vm;

  const RidesSelectionContent({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    final rides = vm.matchingRide();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m,
          right: BlaSpacings.m,
          top: BlaSpacings.s,
        ),
        child: Column(
          children: [
            RideSelectionHeader(
              ridePreference: vm.selectedPreference!,
              onBackPressed: () => Navigator.pop(context),
              onFilterPressed: () {},
              onPreferencePressed: () => _onPreferencePressed(context, vm),
            ),

            const SizedBox(height: 100),

            Expanded(
              child: ListView.builder(
                itemCount: rides.length,
                itemBuilder: (ctx, index) {
                  final ride = rides[index];

                  return RideSelectionTile(ride: ride, onPressed: () {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPreferencePressed(BuildContext context, RideSelectionModel vm) async {
    RidePreference? newPreference = await Navigator.of(context)
        .push<RidePreference>(
          AnimationUtils.createRightToLeftRoute(
            RidePreferenceModal(initialPreference: vm.selectedPreference),
          ),
        );

    if (newPreference != null) {
      vm.selectPreference(newPreference);
    }
  }
}
