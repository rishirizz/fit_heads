import 'package:fit_heads/models/exercise.dart';
import 'package:fit_heads/models/workout.dart';
import 'package:flutter/material.dart';

class WorkOutData with ChangeNotifier {
// initialise empty
  List<Workout> workoutList = [
    Workout(
      name: 'Upper Body Workout',
      exercises: [
        Exercise(
          name: 'Bicep Curls',
          weight: '10',
          reps: '15',
          sets: '3',
        ),
      ],
    ),
  ];

//get the list of workouts
  List<Workout> getWorkOutList() {
    return workoutList;
  }

  //get no of exercises for a given workout
  getNumberOfExercisesInWorkout(String workoutName) {
    Workout relevantWorkOut = getRelevantWorkout(workoutName);
    return relevantWorkOut.exercises.length;
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
    Workout relevantWorkout = getRelevantWorkout(workoutName);
    relevantWorkout.exercises.add(
      Exercise(
        name: exerciseName,
        weight: weight,
        reps: reps,
        sets: sets,
      ),
    );
    notifyListeners();
  }

//Check off the exercise once done
  checkOffExercise(String workoutName, String exerciseName) {
    Exercise relevantExercise = getRelevantExercise(workoutName, exerciseName);
    relevantExercise.isCompleted = !relevantExercise.isCompleted;
    notifyListeners();
  }

  //get the relevant workout
  getRelevantWorkout(String workoutName) {
    return workoutList.firstWhere((workout) => workout.name == workoutName);
  }

  //get the relevant exercise
  getRelevantExercise(String workoutName, String exerciseName) {
    Workout relevantWorkout = getRelevantWorkout(workoutName);
    return relevantWorkout.exercises
        .firstWhere((exercise) => exercise.name == exerciseName);
  }
}
