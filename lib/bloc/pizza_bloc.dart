import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_pizzaapp/bloc/pizza_event.dart';
import 'package:flutter_bloc_pizzaapp/bloc/pizza_state.dart';
import '../models/pizza_model.dart';

class PizzaBloc extends Bloc<PizzaEvent, PizzaState> {
  PizzaBloc() : super(PizzaInitial()) {
    on<LoadPizzaCounter>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const PizzaLoaded(pizzas: <Pizza>[]));
    });
    on<AddPizza>(
      (event, emit) {
        if (state is PizzaLoaded) {
          final state = this.state as PizzaLoaded;
          emit(PizzaLoaded(
            pizzas: List.from(state.pizzas)..add(event.pizza),
          ));
        }
      },
    );
    on<RemovePizza>(
      (event, emit) {
        if (state is PizzaLoaded) {
          final state = this.state as PizzaLoaded;
          emit(PizzaLoaded(
            pizzas: List.from(state.pizzas)..add(event.pizza),
          ));
        }
      },
    );
  }
}
