import "package:flutter/material.dart";
// TODO(bruhh): learn this way of keeping todos.

class SliderComponent extends StatefulWidget {
  late final Function(double) onPressed;
  late final String question;
  late final String index;
  SliderComponent(this.question, this.index, this.onPressed);

  @override
  _SliderComponentState createState() =>
      _SliderComponentState(this.question, this.index, this.onPressed);
}

class _SliderComponentState extends State<SliderComponent> {
  var rating = 0.0;
  late final String index; 
  var activeColor = Colors.red;
  var inactiveColor = Colors.red;
  late final Function(double) onPressed;
  late final String question;

  _SliderComponentState(this.question, this.index, this.onPressed);

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
            Container(
              child: Text(
                this.question,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30.0),
              width: 500.0,
              child: Slider(
                value: rating,
                onChanged: (newnum) {
                  this.onPressed(newnum);
                  setState(() {
                    this.rating = newnum;
                    if (newnum == 5.0) {
                      this.activeColor = this.inactiveColor = Colors.green;
                    } else if (newnum == 4.0) {
                      this.activeColor = this.inactiveColor = Colors.lime;
                    } else if (newnum == 3.0) {
                      this.activeColor = this.inactiveColor = Colors.yellow;
                    } else if (newnum == 2.0) {
                      this.activeColor = this.inactiveColor = Colors.amber;
                    } else if (newnum == 1.0) {
                      this.activeColor = this.inactiveColor = Colors.orange;
                    } else {
                      this.activeColor = this.inactiveColor = Colors.red;
                    }
                  });
                },
                activeColor: this.activeColor,
                inactiveColor: this.inactiveColor,
                divisions: 5,
                max: 5,
                label: '$rating',
              ),
            ),
            ElevatedButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                primary: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pushNamed(context, this.index);
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
