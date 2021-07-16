import "package:flutter/material.dart";
import 'slider.dart';
import 'result.dart';

class Questions extends StatefulWidget {
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  var _questions = [
    "How well did you like our services?",
    "How did you appreciate the sanitation?",
    "How was the sound quality?",
    "How was the lighting?",
    "How likely are you to recommend us to your friends?",
    "How likely are you to come back?"
  ];
  List<double> _points = [0, 0, 0, 0, 0, 0, 0];
  late final List<SliderComponent> sliders;

  Function(double) func(int index) {
    return (double newRating) => setState(() => _points[index] = newRating);
  }

  _QuestionsState() {
    this.sliders = [0, 1, 2, 3, 4, 5]
        .map(
          (e) => SliderComponent(
            _questions[e],
            '/$e',
            func(e),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => this.sliders[0],
        '/0': (context) => this.sliders[1],
        '/1': (context) => this.sliders[2],
        '/2': (context) => this.sliders[3],
        '/3': (context) => this.sliders[4],
        '/4': (context) => this.sliders[5],
        '/5': (context) => Result(this._points),
      },
    );
  }
}
