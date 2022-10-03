/* Stage 1 - Project (originally uploaded to the wrong repo) */

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/* To-do:
*   Fix buttons.
*   Add logic to lactose intolerant question. (If yes is selected, show the next question. If
*   not, return the result statement.)
*   Fix slider functionality.
*   Add result statement.
*   Get rid of yellow tape.
*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Food Survey';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
          body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  MyCustomForm({super.key});
  late double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    var food;
    var lactose;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(" "),
        const Text(" "),
        const Text(
          'Q1. How do you feel about adding different sauces/seasonings to your food?',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Proxima Nova',
            color: Colors.blue,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Your opinion:',
            ),
          ),
        ),
        const Text(
          "Q2. If you were forced to eat pasta for the rest of your life, which pasta dish would you choose?",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Proxima Nova',
            color: Colors.blue,
          ),
        ),

        Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: DropdownButton(
                items: const [
                  DropdownMenuItem(value: 3, child: Text("Pasta Marinara")),
                  DropdownMenuItem(value: 4, child: Text("Mac & Cheese")),
                  DropdownMenuItem(value: 5, child: Text("Butter noodles")),
                  DropdownMenuItem(value: 6, child: Text("Classic Lasagna")),
                  DropdownMenuItem(value: 7, child: Text("Spaghetti Bolognese")),
                ],
                onChanged: (value) {
                  setState(() {
                    value = value;
                  });
                }),
          ),
        ),

        const Text(
          "Q3. What is your favorite type of animal-based protein?",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Proxima Nova',
            color: Colors.blue,
          ),
        ),
        const Text(" "),
        Column (
          children: [
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
          ],
        ),
        const Text(" "),
        const Text(" "),
        const Text(
          "Q4. Using this slider, indicate how likely you are to eat snacks throughout the "
              "day. Left being highly unlikely and right being extremely likely.",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Proxima Nova',
            color: Colors.blue,
          ),
        ),
          Slider(
              value: _currentSliderValue,
              max: 100,
              divisions: 5,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                _currentSliderValue = value;
                  });
                },
              ),

        const Text(" "),
        const Text(
          "Q5. Are you lactose intolerant?",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Proxima Nova',
            color: Colors.blue,
          ),
        ),
        Column (
          children: [
            RadioListTile(
              title: const Text("Yes"),
              value: "yes",
              groupValue: lactose,
              onChanged: (value) {
                setState(() {
                  lactose = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("No"),
              value: "no",
              groupValue: lactose,
              onChanged: (value) {
                setState(() {
                  lactose = value.toString();
                });
              },
            ),
          ],
        ),

        const Text(" "),
        const Text(
          "Q5. What type of cheese appears to you the most?",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Proxima Nova',
            color: Colors.blue,
          ),
        ),

        Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: DropdownButton(
                items: const [
                  DropdownMenuItem(value: 3, child: Text("Mozerella")),
                  DropdownMenuItem(value: 4, child: Text("Cheddar")),
                  DropdownMenuItem(value: 5, child: Text("Colby Jack")),
                  DropdownMenuItem(value: 6, child: Text("Brie")),
                  DropdownMenuItem(value: 7, child: Text("Gouda")),
                  DropdownMenuItem(value: 7, child: Text("Kraft Singles")),
                ],
                onChanged: (value) {
                  setState(() {
                    value = value;
                  });
                }),
          ),
        ),

        const Text(" "),
        const Text(" "),
        const Text("Based on your responses, we recommend you"),

      ],
    );
  }

  void setState(Null Function() param0) {}
}
