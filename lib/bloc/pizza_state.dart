import 'package:equatable/equatable.dart';

import '../models/pizza_model.dart';

class PizzaState extends Equatable {
  const PizzaState();
  @override
  List<Object> get props => [];
}

class PizzaInitial extends PizzaState {}

class PizzaLoaded extends PizzaState {
  final List<Pizza> pizzas;
  const PizzaLoaded({required this.pizzas});

  @override
  List<Object> get props => [pizzas];
}
