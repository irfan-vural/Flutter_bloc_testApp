import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pizzaapp/bloc/pizza_bloc.dart';
import 'package:flutter_bloc_pizzaapp/bloc/pizza_event.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return BlocProvider(
      create: (context) => PizzaBloc()..add(LoadPizzaCounter()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'The Pizza Bloc',
        home: MyHomePage(),
      ),
    );
  }
}
