import 'package:fit_heads/pages/home_page.dart';
import 'package:fit_heads/pages/workout_details_page.dart';
import 'package:fit_heads/state_management/workout_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkOutData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
        onGenerateRoute: (RouteSettings settings) {
          debugPrint('build route for ${settings.name}');
          var routes = <String, WidgetBuilder>{
            WorkoutDetailsPage.routeName: (BuildContext context) =>
                WorkoutDetailsPage(
                  workoutName: settings.arguments.toString(),
                ),
          };
          WidgetBuilder builder = routes[settings.name]!;
          return MaterialPageRoute(
            builder: (ctx) => builder(ctx),
          );
        },
      ),
    );
  }
}
