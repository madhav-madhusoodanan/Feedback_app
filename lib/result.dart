import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  late final String message;
  late final color;
  Result(List<double> resultArr) {
    var result = 0.0;
    result = resultArr.reduce((value, element) => value + element);
    resultArr = [0, 0, 0, 0, 0, 0];
    if (result < 11) {
      this.color = Colors.red;
      this.message = "We are sorry for your inconveniencce";
    } else if (result < 21) {
      this.color = Colors.yellow;
      this.message = "Hope we serve you better next time";
    } else if (result < 31) {
      this.color = Colors.green;
      this.message = "We hope you come back next time";
    } else {
      this.color = Colors.purple;
      this.message = "hehe";
    }
  }

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Questions'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              this.widget.message,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: this.widget.color,
              ),
            ),
            ElevatedButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                primary: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text("Restart"),
            ),
          ],
        ),
      ),
    );
  }
}
