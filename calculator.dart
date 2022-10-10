import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var myController = TextEditingController();
  var yourController = TextEditingController();
  var myText = '';
  var yourText = '';
  var result = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: myController,
                  decoration: const InputDecoration(
                      hintText: 'Operand 1'
                  ),
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: yourController,
                  decoration: const InputDecoration(
                      hintText: 'Operand 2'
                  ),
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 20.0
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: add,
                      child: const Text (
                        '+',
                        textScaleFactor: 3.0,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: subtract,
                      child: const Text(
                        '-',
                        textScaleFactor: 3.0,
                      )
                    ),
                    ElevatedButton(
                        onPressed: multiply,
                        child: const Text(
                          '*',
                          textScaleFactor: 3.0,
                        )
                    ),
                    ElevatedButton(
                        onPressed: divide,
                        child: const Text(
                          '/',
                          textScaleFactor: 3.0,
                        )
                    ),
                  ]
                )
              ]
            )
          )
        )
      )
    );
  }

  add() {
    var res = int.parse(myController.text) + int.parse(yourController.text);
    setState(() => yourController.text = "Result: $res");
    setState(() => myController.text = '____________');
    print("yay i did it!");
  }

  subtract() {
    var res = int.parse(myController.text) - int.parse(yourController.text);
    setState(() => yourController.text = "Result: $res");
    setState(() => myController.text = '____________');
    print("yay i did it!");
  }

  multiply() {
    var res = int.parse(myController.text) * int.parse(yourController.text);
    setState(() => yourController.text = "Result: $res");
    setState(() => myController.text = '____________');
    print("yay i did it!");
  }

  divide() {
    var res = int.parse(myController.text) / int.parse(yourController.text);
    setState(() => yourController.text= "Result: $res");
    setState(() => myController.text = '____________');
    print("yay i did it!");
  }

}
