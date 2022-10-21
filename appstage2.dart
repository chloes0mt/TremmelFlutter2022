import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

const _youAre = 'That is';
const _compatible = 'a lot';

var _listOfItems1 = [
  DropdownMenuItem(
    value: 0,
    child: Text("Pasta Marinara"),
  ),
  DropdownMenuItem(
    value: 1,
    child: Text("Cavatelli & Brocolli"),
  ),
  DropdownMenuItem(
    value: 2,
    child: Text("Butter noodles"),
  ),
  DropdownMenuItem(
    value: 3,
    child: Text("Classic Lasagna"),
  ),
  DropdownMenuItem(
    value: 4,
    child: Text("Spaghetti Bolognese"),
  ),
];

var _listOfItems2 = [
  DropdownMenuItem(
    value: 0,
    child: Text("Mozerella"),
  ),
  DropdownMenuItem(
    value: 1,
    child: Text("Cheddar"),
  ),
  DropdownMenuItem(
    value: 2,
    child: Text("Colby Jack"),
  ),
  DropdownMenuItem(
    value: 3,
    child: Text("Brie"),
  ),
  DropdownMenuItem(
    value: 4,
    child: Text("Gouda"),
  ),
];

class _MyAppState extends State<MyApp> {
  var _snackFlutterSliderValue = 1.0;
  var _messageToUser = "";
  var myController = TextEditingController();
  var myText = '';
  var _dropdownValue;
  var switchValue = false;
  var checkBoxValue = false;
  var result = "";
  var visibility = true;

  void _refreshScreen(newValue) {
    /////////// changed
    setState(() => _dropdownValue = newValue);
  }

  @override
  Widget build(BuildContext context) {
    var food;
    return MaterialApp(
      home: Material(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("What kind of sauces and/or seasonings do you like to add to your food?"),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: myController,
                  onChanged: changeText,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  myText,
                  textScaleFactor: 1.0,
                ),
                ElevatedButton(
                  onPressed: addStars,
                  child: Text(
                    'Submit',
                    textScaleFactor: 1.0,
                  ),
                ),
                Divider(),
                Text(
                  "If you were forced to eat pasta for the rest of your life, which pasta dish would you choose?",
                  textScaleFactor: 1,
                ),
                DropdownButton<int>(
                  items: _listOfItems1,
                  onChanged: _refreshScreen,
                  value: _dropdownValue,
                  hint: Text(
                    "Select One",
                    textScaleFactor: 1,
                  ),
                ),
                Text(
                  _dropdownValue != null
                      ? _dropdownValue.toString()
                      : "No Selection",
                  textScaleFactor: 1,
                ),
                Divider(),
                Text("What's your favorite type of animal protein?"),
                RadioListTile(
                  title: const Text("Chicken"),
                  value: "chicken",
                  groupValue: food,
                  onChanged: (value) {
                    setState(() {
                      food = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("Beef"),
                  value: "beef",
                  groupValue: food,
                  onChanged: (value) {
                    setState(() {
                      value = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("Pork"),
                  value: "pork",
                  groupValue: food,
                  onChanged: (value) {
                    setState(() {
                      value = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("Fish"),
                  value: "fish",
                  groupValue: food,
                  onChanged: (value) {
                    setState(() {
                      value = value.toString();
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Text("Using this slider, indicate how likely you are to have small snacks throughout the day. "),
                      _buildSnackFlutterSlider(),
                      _buildResultArea(),
                      Divider(),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Text("Check the box if you're NOT lactose intolerant."),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Switch(
                            value: switchValue,
                            onChanged: handleSwitch,
                          ),
                          Text(
                            '$switchValue',
                            textScaleFactor: 1.0,
                          ),
                        ],
                      ),
                      Text(
                        "What type of cheese appeals to you the most?",
                        textScaleFactor: 1,
                      ),
                      Visibility(
                        child: DropdownButton<int>(
                          items: _listOfItems2,
                          onChanged: _refreshScreen,
                          value: _dropdownValue,
                          hint: Text(
                            "Select One",
                            textScaleFactor: 1,
                          ),
                        ),
                      ),
                      Text(
                        _dropdownValue != null
                            ? _dropdownValue.toString()
                            : "No Selection",
                        textScaleFactor: 1,
                      ),
                    ],
                  ),
                ),
                      SizedBox(
                        height: 2.0,
                      ),
                      ElevatedButton(
                        onPressed: submitSurvey,
                        child: Text(
                          'Submit Survey',
                          textScaleFactor: 1.0,
                        ),
                      ),
                      Text(
                      '$result',
                      textScaleFactor: 1.0,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Build
  Widget _buildSnackFlutterSlider() {
    return Column(
      children: [
        SizedBox(
          height: 2.0,
        ),
        Slider(
          min: 1.0,
          max: 10.0,
          divisions: 9,
          value: _snackFlutterSliderValue,
          onChanged: _updateSnackFlutterSlider,
          label: '${_snackFlutterSliderValue.toInt()}',
        ),
      ],
    );
  }

  void _updateSnackFlutterSlider(double newValue) {
    setState(() {
      _snackFlutterSliderValue = newValue;
    });
  }

  Widget _buildResultArea() {
    return Row(
      children: <Widget>[
        ElevatedButton(
          child: Text("Submit"),
          onPressed: _updateResults,
        ),
        SizedBox(
          width: 2.0,
        ),
        Expanded(
          child: Text(
            _messageToUser,
            textAlign: TextAlign.center,
            textScaleFactor: 1,
          ),
        ),
      ],
    );
  }

  void _updateResults() {
    setState(() {
      _messageToUser = _youAre +
          (_snackFlutterSliderValue >= 8 ? " " : " not ") +
          _compatible;
    });
  }

  changeText(newText) {
    setState(() => myText = newText);
  }

  addStars() {
    setState(() {
      myController.text = myText;
      myText = myText;
    });
  }

  handleSwitch(newValue) {
    print(newValue);
    setState(
          () => switchValue = newValue,
    );
  }

  handleCheckbox(newValue) {
    print(newValue);
    setState(
          () => checkBoxValue = newValue,
    );
    if(checkBoxValue=true) {
      setState(
            () => visibility = false,
      );
    }
  }


  submitSurvey() {
    if (checkBoxValue=false) {
      setState(
            () =>
        result =
        "Based on what you answered, we recommend you have $_dropdownValue with lots of $myText"
            "and you can have snacks $_snackFlutterSliderValue a day if you feel so inclined, but you CAN'T have cheese because you're"
            " lactose intolerant.",
      );
    }
    else {
      setState(
            () =>
        result =
        "Based on what you answered, we recommend you have $_dropdownValue with lots of $myText"
            "and you can have snacks $_snackFlutterSliderValue a day if you feel so inclined. In addition to this, you CAN have cheese because you're NOT"
            "lactose intolerant.",
      );
    }
  }

}
