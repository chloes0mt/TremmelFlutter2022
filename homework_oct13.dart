import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Homework October 13th';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  double _currentSliderValue = 1;
  String res = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("On a scale of 1-10, how much do you love developing Flutter Apps?", style:
        TextStyle(fontSize: 20)),
        Slider(
          value: _currentSliderValue,
          min: 1.0,
          max: 10.0,
          divisions: 10,
          activeColor: Colors.green,
          inactiveColor: Colors.pink,
          thumbColor: Colors.blueGrey,
          label: _currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
            });
          },
        ),
        Text("$res", style: TextStyle(fontSize: 20)),
        ElevatedButton(onPressed: submit, child: Text("Submit")),
      ],
    );
  }
  submit(){
    if(_currentSliderValue < 8) {
      setState(() {
        res = "You are NOT compatible with Doris D. Developer";
      });
    }
    else {
      setState(() {
        res = "You are INDEED compatible with Doris D. Developer";
      });
    }
  }
}
