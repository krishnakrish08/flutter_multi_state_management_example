import 'package:flutter/material.dart';
import 'package:flutter_multiple_state_managements_in_one/inherited_provider_bloc/multi_state_home_screen.dart';
import 'package:flutter_multiple_state_managements_in_one/inherited_provider_bloc/models/app_model.dart';
import 'package:flutter_multiple_state_managements_in_one/inherited_provider_bloc/models/counter_model.dart';
import 'package:flutter_multiple_state_managements_in_one/inherited_provider_bloc/models/settings_model.dart';
import 'package:flutter_multiple_state_managements_in_one/inherited_provider_bloc/models/user_model.dart';
import 'package:provider/provider.dart';

class MultiStateApp extends StatelessWidget {
  const MultiStateApp({super.key});

  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<CounterModel>(context);
    final userModel = Provider.of<UserModel>(context);
    final settingsModel = Provider.of<SettingsModel>(context);

    return AppModel(
      counterModel: counterModel,
      userModel: userModel,
      settingsModel: settingsModel,
      child: const MaterialApp(
        home: MultiStateHomeScreen(),
      ),
    );
  }
}
