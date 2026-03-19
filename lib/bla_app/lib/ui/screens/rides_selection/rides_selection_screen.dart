import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../states/ride_preference_state.dart';
import '../../../data/repository/ride/ride_repository.dart';
import 'view_model/ride_selection_model.dart';
import 'widgets/ride_selection_content.dart';

class RidesSelectionScreen extends StatelessWidget {
  const RidesSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prefState = context.read<RidePreferenceState>();
    final rideRepo = context.read<RideRepository>();

    return ChangeNotifierProvider(
      create: (_) => RideSelectionModel(
        preferenceState: prefState,
        rideRepository: rideRepo,
      ),
      builder: (context, child) {
        final vm = context.watch<RideSelectionModel>();

        return RidesSelectionContent(vm: vm);
      },
    );
  }
}
