import 'package:bloc_counter/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  static const TextStyle counterTextStyle =
      TextStyle(fontSize: 60, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Counter"),
        ),
        body: BlocBuilder<CounterBloc, int>(builder: (context, count) {
          return Center(
            child: Text("$count".padLeft(2,'0'), style: counterTextStyle),
          );
        }),
        floatingActionButton: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: FloatingActionButton(
                  heroTag: "btn1",
                  child: Icon(Icons.add),
                  onPressed: () => counterBloc.add(CounterEvent.increment),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: FloatingActionButton(
                  heroTag: "btn2",
                  child: Icon(Icons.remove),
                  onPressed: () => counterBloc.add(CounterEvent.decrement),
                ),
              ),
            ]));
  }
}
