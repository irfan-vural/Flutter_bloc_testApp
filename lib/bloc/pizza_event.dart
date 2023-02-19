import 'package:equatable/equatable.dart';

import '../models/pizza_model.dart';

class PizzaEvent extends Equatable {
  const PizzaEvent();
  @override
  List<Object> get props => [];
}

class LoadPizzaCounter extends PizzaEvent {}

class AddPizza extends PizzaEvent {
  final Pizza pizza;
  const AddPizza(this.pizza);

  @override
  List<Object> get props => [pizza];
}

class RemovePizza extends PizzaEvent {
  final Pizza pizza;
  const RemovePizza(this.pizza);

  @override
  List<Object> get props => [pizza];
}
