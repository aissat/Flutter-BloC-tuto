import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

//     Start — informs the TimerBloc that the timer should be started.
//     Pause — informs the TimerBloc that the timer should be paused.
//     Resume — informs the TimerBloc that the timer should be resumed.
//     Reset — informs the TimerBloc that the timer should be reset to the original state.
//     Tick — informs the TimerBloc that a tick has occurred and that it needs to update its state accordingly.

abstract class TimerEvent extends Equatable {
  const TimerEvent();
  @override
  List<Object> get props => [];
}

class Start extends TimerEvent {
  final int duration;
  const Start({@required this.duration});
}

class Pause extends TimerEvent {}

class Resume extends TimerEvent {}

class Reset extends TimerEvent {}

class Tick extends TimerEvent {
  final int duration;
  const Tick({@required this.duration});

  @override
  List<Object> get props => [duration];
}
