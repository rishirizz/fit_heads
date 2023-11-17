import 'package:fit_heads/pages/workout_details_page.dart';
import 'package:fit_heads/state_management/workout_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController workOutNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<WorkOutData>(
        builder:
            (BuildContext context, WorkOutData workOutData, Widget? child) =>
                Scaffold(
          appBar: AppBar(
            title: const Text('FitHeads'),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              // workOutData.addWorkout('Upper Body Workout');
              createNewWorkout(workOutData);
            },
            label: const Text(
              'Create a new Workout',
            ),
          ),
          body: ListView.builder(
            itemCount: workOutData.getWorkOutList().length,
            itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text(
                workOutData.workoutList[index].name.toString(),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios,
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    WorkoutDetailsPage.routeName,
                    arguments: workOutData.workoutList[index].name,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  createNewWorkout(WorkOutData workOutData) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Create a Workout'),
        content: TextField(
          controller: workOutNameController,
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
              workOutData.addWorkout(workOutNameController.text);
              workOutNameController.clear();
              Navigator.pop(context);
            },
            child: const Text('SAVE'),
          ),
        ],
      ),
    );
  }
}
