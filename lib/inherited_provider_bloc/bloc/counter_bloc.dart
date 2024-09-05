import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multiple_state_managements_in_one/inherited_provider_bloc/bloc/counter_event.dart';
import 'package:flutter_multiple_state_managements_in_one/inherited_provider_bloc/bloc/increment_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield state + 1;
    }
  }
}
