import 'package:blabla/bla_app/lib/ui/screens/home/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/home_content.dart';
import '../../states/ride_preference_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          HomeViewModel(preferenceState: context.watch<RidePreferenceState>()),
      child: HomeContent(),
    );
  }
}
