import 'package:counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    final counter = counterCubit.state;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text('$counter', style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterCubit.increment();
          setState(() {});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
