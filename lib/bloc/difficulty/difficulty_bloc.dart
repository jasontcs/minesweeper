export 'difficulty_event.dart';
export 'difficulty_state.dart';
export 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'difficulty_event.dart';
import 'difficulty_state.dart';

class DifficultyBloc extends Bloc<DifficultyEvent, DifficultyState> {
  DifficultyBloc() : super(initialState);
}
