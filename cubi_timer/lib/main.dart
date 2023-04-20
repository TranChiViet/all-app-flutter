import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/cubit/timer_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Bloc Timer'),
      ),
      body: BlocBuilder<TimerCubit, TimerState>(
        builder: (context, state) {
          if (state is TimerInitial) {
            return Center(
                child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<TimerCubit>(context).startTimer(0);
                    },
                    child: const Text('Start')));
          }
          if (state is TimerProgress) {
            return Center(
              child: Text(
                '${state.elapsed}',
                style: const TextStyle(fontSize: 36),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
