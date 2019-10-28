import 'package:bloc_counter/timer/background.dart';
import 'package:bloc_counter/timer/bloc/bloc.dart';
import 'package:bloc_counter/timer/timer_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerView extends StatelessWidget {
  static const TextStyle timerTextStyle =
      TextStyle(fontSize: 60, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer'),
      ),
      body: Stack(
        children: <Widget>[
          // Background(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100.0),
                child: Center(
                  child: BlocBuilder<TimerBloc, TimerState>(
                    builder: (context, state) {
                      final minutesStr = ((state.duration / 60) % 60)
                          .floor()
                          .toString()
                          .padLeft(2, '0');
                      final secondsStr =
                          (state.duration % 60).floor().toString().padLeft(2, '0');
                      return Text(
                        '$minutesStr : $secondsStr',
                        style: timerTextStyle,
                      );
                    },
                  ),
                ),
              ),
              BlocBuilder<TimerBloc, TimerState>(
                builder: (context,state) => TimerActions(),
                condition: (previousState, state) =>
                    state.runtimeType != previousState.runtimeType,

              )
            ],
          ),
        ],
      ),
    );
  }
}
