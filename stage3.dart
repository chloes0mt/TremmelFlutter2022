import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
const List<String> list = <String>['Pasta Marinara', 'Cavatelli & Brocoli', 'Butter Noodles', 'Classic Lasagna', 'Spaghetti Bolognese'];
const List<String> list2 = <String>['Mozerella', 'Cheddar', 'Colby Jack', 'Brie', 'Gouda'];

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'What should you eat?';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

enum animal_protein { chicken, beef, pork, venison, fish}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();

}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  /* global variables */
  var myController = TextEditingController();
  var myText = '';
  animal_protein? _meat = animal_protein.chicken;
  double _currentSliderValue = 0;
  bool switchValue = false;
  String dropdownValue = list.first;
  String dropdownValue2 = list2.first;
  final ButtonStyle style =
  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  bool _isVisible = false;
  var result = "";
  void showWid() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        const Text("What kind of sauces and/or seasonings do you like to add to your food?"),
        TextFormField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Example answer: BBQ Sauce and Adobo',
          ),
          onChanged: changeText,
        ),
        const Divider(),
        const Text(
          "If you were forced to eat pasta for the rest of your life, which pasta dish would you choose?",
          textScaleFactor: 1,
        ),
        DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? value) {
            // This is called when the user selects an item.
            setState(() {
              dropdownValue = value!;
            });
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Divider(),
        Text("What's your favorite type of animal protein?"),
        ListTile(
          title: Text('Chicken'),
          leading: Radio<animal_protein>(
            value: animal_protein.chicken,
            groupValue: _meat,
            onChanged: (animal_protein? value) {
              setState(() {
                _meat = value;
              });
            },
          ),
        ),
        ListTile(
          title: Text('Beef'),
          leading: Radio<animal_protein>(
            value: animal_protein.beef,
            groupValue: _meat,
            onChanged: (animal_protein? value) {
              setState(() {
                _meat = value;
              });
            },
          ),
        ),
        ListTile(
          title: Text('Pork'),
          leading: Radio<animal_protein>(
            value: animal_protein.pork,
            groupValue: _meat,
            onChanged: (animal_protein? value) {
              setState(() {
                _meat = value;
              });
            },
          ),
        ),
        ListTile(
          title: Text('Venison'),
          leading: Radio<animal_protein>(
            value: animal_protein.venison,
            groupValue: _meat,
            onChanged: (animal_protein? value) {
              setState(() {
                _meat = value;
              });
            },
          ),
        ),
        ListTile(
          title: Text('Fish'),
          leading: Radio<animal_protein>(
            value: animal_protein.fish,
            groupValue: _meat,
            onChanged: (animal_protein? value) {
              setState(() {
                _meat = value;
              });
            },
          ),
        ),
        const Divider(),
        const Text("Using this slider, indicate how likely you are to have small snacks throughout the day. "),
        Slider(
          value: _currentSliderValue,
          max: 10,
          divisions: 9,
          label: _currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
            });
          },
        ),
        const Divider(),
        const Text("Can your body tolerate lactose?"),
        Switch (
          onChanged: (newValue){
            setState((){
              switchValue = newValue;
              _isVisible = !_isVisible;
            });
          },
          value: switchValue,
        ),
        const Text(
        "What type of cheese appeals to you the most?",
        textScaleFactor: 1,
        ),
        Visibility(
          visible: _isVisible,
          child: DropdownButton<String>(
            value: dropdownValue2,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue2 = value!;
              });
            },
            items: list2.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        ElevatedButton(
          style: style,
          onPressed: submitSurvey,
          child: const Text('Submit'),
        ),
        Text(
          '$result',
          textScaleFactor: 2.0,
        ),
        ElevatedButton(
          style: style,
          onPressed: goToDetailPage,
          child: const Text('Find recipes'),
        ),
      ],
      ),
    );
  }


  submitSurvey() {
    if(switchValue=false) {
      setState(() => result = "Based on what you answered, we recommend you have $_meat with lots of $myText"
          " on top or on the side. You may also enjoy a bowl of $dropdownValue. No cheese though, because you're lactose intolerant."
          " You can snack on $_meat bites $_currentSliderValue times a day if you're feeling peckish."
      );
    }
    else if(switchValue=true) {
      setState(() => result = "Based on what you answered, we recommend you have $_meat with lots of $myText"
          " on top or on the side. You may also enjoy a bowl of $dropdownValue generously topped with $dropdownValue2."
          " You can snack on $_meat bites $_currentSliderValue times a day if you're feeling peckish."
      );
    }
  }

  changeText(newText) {
    setState(() => myText = newText);
  }

  goToDetailPage() async {
    Navigator.push(
      //localRating = Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(),
      ),
    );
    setState(() {});
  }
}

class DetailPage extends StatelessWidget {
  final url = Uri.https(
    'www.googleapis.com',
    '/books/v1/volumes',
    {'q': 'Recipes'},
  );

  var rating = 0;

  updateRating(String newText) {
    rating = int.parse(newText);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Text(
            '$url This is where the web-scraped results for recipes based on the users preferences would show up. ',
          ),
          ElevatedButton(
            child: Text(
              "Home",
              textScaleFactor: 2,
            ),
            onPressed: () => Navigator.pop(context, rating),
          ),
          TextField(
            onChanged: updateRating,
            keyboardType: TextInputType.numberWithOptions(
              signed: false,
              decimal: false,
            ),
            decoration: InputDecoration(
              hintText: 'How did you like this recipe?',
            ),
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}


