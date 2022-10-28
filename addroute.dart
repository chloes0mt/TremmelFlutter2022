import 'package:flutter/material.dart';

void main() => runApp(App08Main());

class App08Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MovieTitlePage(),
    );
  }
}

class MovieTitlePage extends StatefulWidget {
  @override
  MovieTitlePageState createState() => MovieTitlePageState();
}

class MovieTitlePageState extends State<MovieTitlePage> {

  @override
  Widget build(BuildContext context) {
    var myController;
    return Material(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: myController,
            style: TextStyle(
              fontSize: 55,
            ),
          ),
          ElevatedButton(
            child: Text(
              "Next",
              textScaleFactor: 2,
            ),
            onPressed: goToDetailPage,
          ),
        ]
      )
    );
  }
  goToDetailPage() {
    var myController;
    var first_number = int.parse(myController.text);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(),
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final overview = '';

  @override
  Widget build(BuildContext context) {
    var myController;
    return Material(
        child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: myController,
                style: TextStyle(
                  fontSize: 55,
                ),
              ),
              ElevatedButton(
                child: Text (
                  "Add",
                  textScaleFactor: 2,
                ),
                onPressed: goToDoubleDetailPage,
              ),
            ]
        )
    );
  }
  goToDoubleDetailPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DoubleDetailPage(),
      ),
    );
  }
}

class DoubleDetailPage extends StatelessWidget {
  final overview = 'Too much';

  @override
  Widget build(BuildContext context) {
    var myController;
    return Material(
      child: Column (
        children: [
          SizedBox(
            height: 100,
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: myController,
            style: TextStyle(
              fontSize: 55,
            ),
          ),
          ElevatedButton(
            child: Text(
              "Next",
              textScaleFactor: 2,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ]
      )
    );
  }
}
