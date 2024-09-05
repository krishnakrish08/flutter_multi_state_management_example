import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multiple_state_managements_in_one/inherited_provider_bloc/bloc/counter_bloc.dart';
import 'package:flutter_multiple_state_managements_in_one/inherited_provider_bloc/bloc/increment_event.dart';
import 'package:flutter_multiple_state_managements_in_one/inherited_provider_bloc/models/app_model.dart';

class MultiStateHomeScreen extends StatelessWidget {
  const MultiStateHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CounterScreen()),
              );
            },
            child: const Text('Go to Counter Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserScreen()),
              );
            },
            child: const Text('Go to User Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
            child: const Text('Go to Settings Screen'),
          ),
        ],
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body: const Column(
        children: [
          CounterText(),
          IncrementButton(),
          BlocCounterText(),
          BlocIncrementButton(),
        ],
      ),
    );
  }
}

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userModel = AppModel.of(context, aspect: 'user')!.userModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Screen'),
      ),
      body: Column(
        children: [
          Text('User: ${userModel.name}'),
          TextField(
            onChanged: (newName) {
              userModel.updateName(newName);
            },
            decoration: const InputDecoration(labelText: 'Enter new name'),
          ),
        ],
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsModel =
        AppModel.of(context, aspect: 'settings')!.settingsModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Screen'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: settingsModel.darkMode,
            onChanged: (value) {
              settingsModel.toggleDarkMode();
            },
          ),
        ],
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final counter =
        AppModel.of(context, aspect: 'counter')!.counterModel.counter;
    return Text('Counter: $counter');
  }
}

class IncrementButton extends StatelessWidget {
  const IncrementButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        AppModel.of(context, aspect: 'counter')!.counterModel.increment();
      },
      child: const Text('Increment'),
    );
  }
}

class BlocCounterText extends StatelessWidget {
  const BlocCounterText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, int>(
      builder: (context, count) {
        return Text('Bloc Counter: $count');
      },
    );
  }
}

class BlocIncrementButton extends StatelessWidget {
  const BlocIncrementButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<CounterBloc>().add(IncrementEvent());
      },
      child: const Text('Bloc Increment'),
    );
  }
}
