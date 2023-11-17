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
            itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text(
                workOutData
                    .getRelevantWorkout(widget.workoutName)
                    .exercises[index]
                    .name,
              ),
              subtitle: Row(
                children: [
                  //Weight
                  Chip(
                    label: Text(
                      workOutData
                              .getRelevantWorkout(widget.workoutName)
                              .exercises[index]
                              .weight +
                          'kg',
                    ),
                  ),
                  //Reps
                  Chip(
                    label: Text(
                      workOutData
                              .getRelevantWorkout(widget.workoutName)
                              .exercises[index]
                              .sets +
                          'reps',
                    ),
                  ),
                  //Sets
                  Chip(
                    label: Text(
                      workOutData
                              .getRelevantWorkout(widget.workoutName)
                              .exercises[index]
                              .sets +
                          'sets',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
