import 'package:flutter/material.dart';

class ExerciseTile extends StatelessWidget {
  final String name;
  final String weight;
  final String reps;
  final String sets;
  final bool isCompleted;
  final void Function(bool?)? onCheckChanged;

  const ExerciseTile({
    super.key,
    required this.name,
    required this.weight,
    required this.reps,
    required this.sets,
    required this.isCompleted,
    required this.onCheckChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //Weight
          Chip(
            label: Text(
              '$weight kg',
            ),
          ),
          //Reps
          Chip(
            label: Text(
              '$reps reps',
            ),
          ),
          //Sets
          Chip(
            label: Text(
              '$sets sets',
            ),
          ),
        ],
      ),
      trailing: Checkbox(
        value: isCompleted,
        onChanged: (value) => onCheckChanged!(value),
      ),
    );
  }
}
