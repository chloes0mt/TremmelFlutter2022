import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyCustomForm(),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  var text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieve Text Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              //first text field
              onChanged: (value) {
                setState(() {
                valueText = value;
                });
              ),
            const TextField(
              //second text field 
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ElevatedButton(
                    onPressed: copyText,
                    child: Text(
                      'Copy',
                      textScaleFactor: 3.0,
                    ),
                  ),
                  ElevatedButton(
                    child: const Text(
                      'Clear',
                      textScaleFactor: 3.0,
                    ),
                    onPressed: () => setState(() => "   "),
                  ),
                ]
          ),
          ],
        ),
      ),
    );
  }
}

copyText(value_of_text_field2) {
  $value_of_text_field2 = value_from_textfield1 ;
}
              // there are a few errors but i tried. i'll just have to pay extra close attention tomorrow when we go over it. 
