import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/animations_util.dart';
import '../../../theme/theme.dart';
import '../../../widgets/pickers/bla_ride_preference_picker.dart';
import '../../rides_selection/rides_selection_screen.dart';
import '../view_model/home_view_model.dart';
import '../widgets/home_history_tile.dart';

const String blablaHomeImagePath = 'assets/images/blabla_home.png';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();

    return Stack(children: [_buildBackground(), _buildForeground(context, vm)]);
  }

  Widget _buildForeground(BuildContext context, HomeViewModel vm) {
    return Column(
      children: [
        SizedBox(height: 16),

        Align(
          alignment: Alignment.center,
          child: Text(
            "Your pick of rides at low price",
            style: BlaTextStyles.heading.copyWith(color: Colors.white),
          ),
        ),

        SizedBox(height: 100),

        Container(
          margin: EdgeInsets.symmetric(horizontal: BlaSpacings.xxl),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BlaRidePreferencePicker(
                initRidePreference: vm.selectedPreference,
                onRidePreferenceSelected: (pref) async {
                  vm.selectPreference(pref);

                  await Navigator.of(context).push(
                    AnimationUtils.createBottomToTopRoute(
                      RidesSelectionScreen(),
                    ),
                  );
                },
              ),

              SizedBox(height: BlaSpacings.m),

              _buildHistory(context, vm),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHistory(BuildContext context, HomeViewModel vm) {
    final history = vm.history;

    return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: history.length,
        itemBuilder: (ctx, index) => HomeHistoryTile(
          ridePref: history[index],
          onPressed: () async {
            vm.selectPreference(history[index]);

            await Navigator.of(context).push(
              AnimationUtils.createBottomToTopRoute(RidesSelectionScreen()),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return SizedBox(
      width: double.infinity,
      height: 340,
      child: Image.asset(blablaHomeImagePath, fit: BoxFit.cover),
    );
  }
}
