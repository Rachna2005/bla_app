import 'view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/home_content.dart';
import '../../states/ride_preference_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RidePreferenceState preferenceState = context.read<RidePreferenceState>();

    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(preferenceState: preferenceState),
      builder: (context, child) {
        HomeViewModel vm = context.watch<HomeViewModel>();

        return HomeContent(vm: vm);
      },
    );
  }
}
