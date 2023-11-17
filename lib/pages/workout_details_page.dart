import 'package:fit_heads/components/exercise_tile.dart';
import 'package:fit_heads/state_management/workout_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutDetailsPage extends StatefulWidget {
  final String workoutName;
  const WorkoutDetailsPage({
    super.key,
    required this.workoutName,
  });
  static const routeName = '/workoutDetails';

  @override
  State<WorkoutDetailsPage> createState() => _WorkoutDetailsPageState();
}

class _WorkoutDetailsPageState extends State<WorkoutDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<WorkOutData>(
        builder:
            (BuildContext context, WorkOutData workOutData, Widget? child) =>
                Scaffold(
          appBar: AppBar(
            title: Text(
              widget.workoutName,
            ),
          ),
          body: ListView.builder(
            itemCount:
                workOutData.getNumberOfExercisesInWorkout(widget.workoutName),
            itemBuilder: (BuildContext context, int index) => ExerciseTile(
              name: workOutData
                  .getRelevantWorkout(widget.workoutName)
                  .exercises[index]
                  .name,
              weight: workOutData
                  .getRelevantWorkout(widget.workoutName)
                  .exercises[index]
                  .weight,
              reps: workOutData
                  .getRelevantWorkout(widget.workoutName)
                  .exercises[index]
                  .reps,
              sets: workOutData
                  .getRelevantWorkout(widget.workoutName)
                  .exercises[index]
                  .sets,
            ),
          ),
        ),
      ),
    );
  }
}
