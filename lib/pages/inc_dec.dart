import 'package:counter/bloc/counter_bloc.dart';
import 'package:counter/cubit/counter_cubit.dart';
import 'package:counter/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncDecPage extends StatelessWidget {
  const IncDecPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'home',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomePage(title: 'Home'),
                ),
              );
            },
            child: Icon(Icons.navigate_next),
          ),
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () {
              counterBloc.add(CounterIncremented());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () {
              counterBloc.add(CounterDecremented());
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}
