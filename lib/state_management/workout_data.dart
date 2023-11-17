import 'package:fit_heads/models/exercise.dart';
import 'package:fit_heads/models/workout.dart';
import 'package:flutter/material.dart';

class WorkOutData with ChangeNotifier {
// initialise empty
  List<Workout> workoutList = [];

//get the list of workouts
  List<Workout> getWorkOutList() {
    return workoutList;
  }

//add a workout
  addWorkout(String name) {
    workoutList.add(
      Workout(
        name: name,
        exercises: [],
      ),
    );
    notifyListeners();
  }

//add an exercise to a workout
  addExerciseToWorkout(String workoutName, String exerciseName, String weight,
      String reps, String sets) {
    //check if the workout is same
    Workout relevantWorkout =
        workoutList.firstWhere((workout) => workout.name == workoutName);
    relevantWorkout.exercises.add(
      Exercise(
        name: workoutName,
        weight: weight,
        reps: reps,
        sets: sets,
      ),
    );
    notifyListeners();
  }

//Check off the exercise once done
  removeExercise(String workoutName, String exerciseName) {
    //check if the workout is same
    Workout relevantWorkout =
        workoutList.firstWhere((workout) => workout.name == workoutName);
    Exercise relevantExercise = relevantWorkout.exercises
        .firstWhere((exercise) => exercise.name == exerciseName);
    relevantExercise.isCompleted = !relevantExercise.isCompleted;
    notifyListeners();
  }
}
