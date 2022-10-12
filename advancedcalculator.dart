import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var myController = TextEditingController();
  var first, second;
  var isClicked = false;
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
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            controller: myController,
                            decoration: const InputDecoration(
                                hintText: 'Enter a number...'
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
                                  onPressed: btnClicked,
                                  child: const Text (
                                    '+',
                                    textScaleFactor: 3.0,
                                  ),
                                ),
                                ElevatedButton(
                                    onPressed: btnClicked,
                                    child: const Text(
                                      '-',
                                      textScaleFactor: 3.0,
                                    )
                                ),
                                ElevatedButton(
                                    onPressed: setClicked,
                                    child: const Text(
                                      '*',
                                      textScaleFactor: 3.0,
                                    )
                                ),
                                ElevatedButton(
                                    onPressed: setClicked,
                                    child: const Text(
                                      '/',
                                      textScaleFactor: 3.0,
                                    ),
                                ),
                              ],
                          ),
                          Text(" "),
                          Text(" "),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  onPressed: setClicked,
                                  child: const Text(
                                    '=',
                                    textScaleFactor: 3.0,
                                  ),
                              ),
                              ElevatedButton(
                                  onPressed: clear,
                                  child: const Text(
                                    'C',
                                    textScaleFactor: 3.0,
                                  )
                              ),
                            ],
                          ),
                        ]
                    )
                )
            )
        )
    );
  }

  setClicked() {
    setState(() => isClicked = true);
  }

  /* add() {
    var res = int.parse(myController.text) + int.parse(myController.text);
    setState(() => myController.text = "Result: $res");
    setState(() => myController.text = '____________');
    print("yay i did it!");
  }

  subtract() {
    var res = int.parse(myController.text) - int.parse(myController.text);
    setState(() => myController.text = "Result: $res");
    setState(() => myController.text = '____________');
    print("yay i did it!");
  }

  multiply() {
    var res = int.parse(myController.text) * int.parse(myController.text);
    setState(() => myController.text = "Result: $res");
    setState(() => myController.text = '____________');
    print("yay i did it!");
  }

  divide() {
    var res = int.parse(myController.text) / int.parse(myController.text);
    setState(() => myController.text= "Result: $res");
    setState(() => myController.text = '____________');
    print("yay i did it!");
  }

  */

    btnClicked(String btnText) {
    if (btnText == "C") {
      result = "";
      setState(() => {
        myController.text = ''
      });
    }
    else if (btnText == "+" || btnText == "-" || btnText == "*" || btnText = "/") {
      /* i couldn't figure this out */
    }
  }

}
