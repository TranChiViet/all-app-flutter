import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../blocs/workout_cubit.dart';
import '../helpers.dart';
import '../models/exercise.dart';
import '../models/workout.dart';
import '../states/workout_states.dart';

class WorkoutInProgressScreen extends StatelessWidget {
  const WorkoutInProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> _getStats(Workout workout, int workoutElapsed) {
      int workoutTotal = workout.getTotal();
      Exercise exercise = workout.gerCurrentExercise(workoutElapsed);
      int exerciseElapsed = workoutElapsed - exercise.startTime!;
      int exerciseRemaining = exercise.prelude! - exerciseElapsed!;
      bool isPrelude = exerciseElapsed < exercise.prelude!;
      int exerciseTotal = isPrelude ? exercise.prelude! : exercise.duration!;

      if (!isPrelude) {
        exerciseElapsed -= exercise.prelude!;
        exerciseRemaining += exercise.duration!;
      }

      return {
        "workoutTitle": workout.title,
        "workoutProgress": workoutElapsed / workoutTotal,
        "workoutElapsed": workoutElapsed,
        "totalExercises": workout.exercises.length,
        "currentExerciseIndex": exercise.index!.toDouble(),
        "workoutRemaining": workoutTotal - workoutElapsed,
        "exerciseRemaining": exerciseRemaining,
        "exerciseProgress": exerciseElapsed / exerciseTotal,
        "isPrelude": isPrelude
      };
    }

    return BlocConsumer<WorkoutCubit, WorkoutState>(
        builder: (context, state) {
          final stats = _getStats(state.workout!, state.elapsed!);
          return Scaffold(
              appBar: AppBar(
                title: Text(state.workout!.title.toString()),
                leading: BackButton(
                  onPressed: () =>
                      BlocProvider.of<WorkoutCubit>(context).goHome(),
                ),
              ),
              body: Container(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    LinearProgressIndicator(
                      backgroundColor: Colors.blue[100],
                      minHeight: 10,
                      value: stats['workoutProgress'],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(formatTime(stats['workoutElapsed'], true)),
                          DotsIndicator(
                            dotsCount: stats['totalExercises'],
                            position: stats['currentExerciseIndex'],
                          ),
                          Text(
                              '-${formatTime(stats['workoutRemaining'], true)}')
                        ],
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        if (state is WorkoutInProgress) {
                          BlocProvider.of<WorkoutCubit>(context).pauseWorkout();
                        } else if (state is WorkoutPaused) {
                          BlocProvider.of<WorkoutCubit>(context)
                              .resumeWorkout();
                        }
                      },
                      child: Stack(
                        alignment: Alignment(0, 0),
                        children: [
                          Center(
                            child: SizedBox(
                              height: 220,
                              width: 220,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    stats['isPrelude']
                                        ? Colors.red
                                        : Colors.blue),
                                strokeWidth: 25,
                                value: stats['exerciseProgress'],
                              ),
                            ),
                          ),
                          Center(
                            child: SizedBox(
                              height: 300,
                              width: 300,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Image.asset('assets/stopwatch.png'),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ));
        },
        listener: (context, state) {});
  }
}
