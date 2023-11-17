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
  TextEditingController exerciseNameController = TextEditingController();
  TextEditingController exerciseWeightController = TextEditingController();
  TextEditingController exerciseRepController = TextEditingController();
  TextEditingController exerciseSetController = TextEditingController();

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
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              createNewExercise();
            },
            label: const Text(
              'Add a new exercise',
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
              isCompleted: workOutData
                  .getRelevantWorkout(widget.workoutName)
                  .exercises[index]
                  .isCompleted,
              onCheckChanged: (value) {
                Provider.of<WorkOutData>(context, listen: false)
                    .checkOffExercise(
                  widget.workoutName,
                  workOutData
                      .getRelevantWorkout(widget.workoutName)
                      .exercises[index]
                      .name,
                );
                //alternatively, we can use
                // workOutData.checkOffExercise(
                //   widget.workoutName,
                //   workOutData
                //       .getRelevantWorkout(widget.workoutName)
                //       .exercises[index]
                //       .name,
                // );
              },
            ),
          ),
        ),
      ),
    );
  }

  createNewExercise() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Create an Exercise'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: TextField(
                controller: exerciseNameController,
              ),
            ),
            Expanded(
              child: TextField(
                controller: exerciseWeightController,
              ),
            ),
            Expanded(
              child: TextField(
                controller: exerciseRepController,
              ),
            ),
            Expanded(
              child: TextField(
                controller: exerciseSetController,
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('CANCEL'),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<WorkOutData>(context, listen: false)
                  .addExerciseToWorkout(
                widget.workoutName,
                exerciseNameController.text,
                exerciseWeightController.text,
                exerciseRepController.text,
                exerciseSetController.text,
              );
              exerciseNameController.clear();
              exerciseWeightController.clear();
              exerciseRepController.clear();
              exerciseSetController.clear();
              Navigator.pop(context);
            },
            child: const Text('SAVE'),
          ),
        ],
      ),
    );
  }
}
