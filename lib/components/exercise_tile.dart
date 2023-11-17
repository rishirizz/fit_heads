import 'package:flutter/material.dart';

class ExerciseTile extends StatefulWidget {
  final String name;
  final String weight;
  final String reps;
  final String sets;
  final bool isCompleted;

  const ExerciseTile({
    super.key,
    required this.name,
    required this.weight,
    required this.reps,
    required this.sets,
    this.isCompleted = false,
  });

  @override
  State<ExerciseTile> createState() => _ExerciseTileState();
}

class _ExerciseTileState extends State<ExerciseTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.name,
      ),
      subtitle: Row(
        children: [
          //Weight
          Chip(
            label: Text(
              '${widget.weight}kg',
            ),
          ),
          //Reps
          Chip(
            label: Text(
              '${widget.sets}reps',
            ),
          ),
          //Sets
          Chip(
            label: Text(
              '${widget.sets}sets',
            ),
          ),
        ],
      ),
    );
  }
}
