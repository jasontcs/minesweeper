part of 'timer_bloc.dart';

abstract class TimerEvent {}

class _TimerInitial extends TimerEvent {}

class TimerStarted extends TimerEvent {}

class TimerStopped extends TimerEvent {}

class TimerResetted extends TimerEvent {}
