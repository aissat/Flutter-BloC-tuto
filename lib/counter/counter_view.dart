import 'package:bloc_counter/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  // CounterView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Counter"),
        ),
        body: BlocBuilder<CounterBloc, int>(builder: (context, count) {
          return Center(
            child: Text("$count", style: TextStyle(fontSize: 24.0)),
          );
        }),
        floatingActionButton: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () => counterBloc.add(CounterEvent.increment),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: FloatingActionButton(
                  child: Icon(Icons.remove),
                  onPressed: () => counterBloc.add(CounterEvent.decrement),
                ),
              ),
            ]));
  }
}
