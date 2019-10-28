import 'package:bloc_counter/app_const.dart';
import 'package:bloc_counter/counter/counter_bloc.dart';
import 'package:bloc_counter/router.dart';
import 'package:bloc_counter/timer/bloc/bloc.dart';
import 'package:bloc_counter/timer/ticker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: <BlocProvider>[
          BlocProvider<CounterBloc>(
            builder: (context) => CounterBloc(),
          ),
          BlocProvider<TimerBloc>(
            builder: (context) => TimerBloc(ticker: Ticker()),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            //primarySwatch: Colors.amber,
            // primaryColor: Color.fromRGBO(109, 234, 255, 1),
            // accentColor: Color.fromRGBO(72, 74, 126, 1),
            brightness: Brightness.dark,
          ),
          home: HomeView(),
          initialRoute: RoutePath.Home,
          onGenerateRoute: Router.generateRoute,
        ));
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Counte'),
                onPressed: () => Navigator.pushNamed(context, RoutePath.Counter),
              ),
              RaisedButton(
                child: Text('Timer'),
                onPressed: () => Navigator.pushNamed(context, RoutePath.Timer),
              )
            ],
          ),
        ),
      ),
    );
  }
}
