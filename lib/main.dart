import 'package:bloc_counter/app_const.dart';
import 'package:bloc_counter/counter/counter_bloc.dart';
import 'package:bloc_counter/counter/counter_view.dart';
import 'package:bloc_counter/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: BlocProvider(
        builder: (context)=> CounterBloc(),
        child: CounterView(),
      ),
      initialRoute: RoutePath.Home,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
