import 'package:equatable/equatable.dart';

abstract class TimerState extends Equatable {
  final int duration;
  const TimerState(this.duration);

  @override
  List<Object> get props => [duration];
}

class Ready extends TimerState {
  Ready(int duration) : super(duration);

  @override
  String toString() => "Ready {duration: $duration}";
}

class Paused extends TimerState {
  Paused(int duration) : super(duration);

  @override
  String toString() => "Paused {duration: $duration}";
}

class Running extends TimerState {
  Running(int duration) : super(duration);

  @override
  String toString() => "Running {duration: $duration}";
}

class Finished extends TimerState {
  Finished() : super(0);
}
