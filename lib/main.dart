import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multiple_state_managements_in_one/inherited_provider_bloc/bloc/counter_bloc.dart';
import 'package:flutter_multiple_state_managements_in_one/inherited_provider_bloc/multi_state_app.dart';
import 'package:flutter_multiple_state_managements_in_one/inherited_provider_bloc/models/counter_model.dart';
import 'package:flutter_multiple_state_managements_in_one/inherited_provider_bloc/models/settings_model.dart';
import 'package:flutter_multiple_state_managements_in_one/inherited_provider_bloc/models/user_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterModel()),
        ChangeNotifierProvider(create: (context) => UserModel()),
        ChangeNotifierProvider(create: (context) => SettingsModel()),
      ],
      child: BlocProvider(
          create: (context) => CounterBloc(), child: const MultiStateApp()),
    ),
  );
}
