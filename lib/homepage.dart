import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pizzaapp/bloc/pizza_bloc.dart';
import 'package:flutter_bloc_pizzaapp/bloc/pizza_event.dart';
import 'package:flutter_bloc_pizzaapp/bloc/pizza_state.dart';

import 'models/pizza_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Pizza Bloc"),
        centerTitle: true,
        backgroundColor: Colors.orange.shade700,
      ),
      body: Center(
          child: BlocBuilder<PizzaBloc, PizzaState>(builder: (context, state) {
        if (state is PizzaInitial) {
          return CircularProgressIndicator(
            color: Colors.orange,
          );
        }
        if (state is PizzaLoaded) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${state.pizzas.length}',
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.5,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    for (int index = 0; index < state.pizzas.length; index++)
                      Positioned(
                        //left: random.nextInt(250).toDouble(),
                        //  top:  random.nextInt(400).toDouble(),
                        child: SizedBox(
                          height: 150,
                          width: 150,
                          child: state.pizzas[index].image,
                        ),
                      )
                  ],
                ),
              ),
            ],
          );
        } else {
          return Text("Something went wrong");
        }
      })),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.local_pizza_outlined),
            backgroundColor: Colors.orange.shade800,
            onPressed: () {
              context.read<PizzaBloc>().add(AddPizza(Pizza.pizzas[0]));
            },
          ),
          FloatingActionButton(
            child: Icon(Icons.remove),
            backgroundColor: Colors.orange.shade800,
            onPressed: () {
              context.read<PizzaBloc>().add(RemovePizza(Pizza.pizzas[0]));
            },
          ),
          FloatingActionButton(
            child: Icon(Icons.local_pizza),
            backgroundColor: Colors.orange.shade800,
            onPressed: () {
              context.read<PizzaBloc>().add(AddPizza(Pizza.pizzas[1]));
            },
          ),
          FloatingActionButton(
            child: Icon(Icons.remove),
            backgroundColor: Colors.orange.shade800,
            onPressed: () {
              context.read<PizzaBloc>().add(RemovePizza(Pizza.pizzas[1]));
            },
          ),
        ],
      ),
    );
  }
}
