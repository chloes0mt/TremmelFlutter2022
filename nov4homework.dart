/* the log for the switch button was correct but it wouldn't run correctly */
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movie Title',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: buildTitlePageCore3(),
        ),
      ),
    );
  }

  goToDetailPage(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(),
        settings: RouteSettings(
          arguments: index,
        ),
      ),
    );
  }

  Widget buildTitlePageCore1() {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text(
            "Rocky 1",
            textScaleFactor: 2,
          ),
          onTap: () => goToDetailPage(1),
        ),
        ListTile(
          title: Text(
            "Rocky 2",
            textScaleFactor: 2,
          ),
          onTap: () => goToDetailPage(2),
        ),
        ListTile(
          title: Text(
            "Rocky 3",
            textScaleFactor: 2,
          ),
          onTap: () => goToDetailPage(3),
        ),
      ],
    );
  }

  Widget buildTitlePageCore2() {
    return ListView.builder(
      //itemCount: 25,
      itemBuilder: (context, int index) => ListTile(
        title: Text(
          'Rocky ${index + 1}',
          textScaleFactor: 2.0,
        ),
        onTap: () => goToDetailPage(index + 1),
      ),
    );
  }

  Widget buildTitlePageCore3() {
    return ListView(
      children: <Widget>[
        for (int index = 0; index < 25; index++)
          ListTile(
            title: Text(
              'Rocky ${index + 1}',
              textScaleFactor: 2.0,
            ),
            onTap: () => goToDetailPage(index + 1),
          ),
      ],
    );
  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: buildDetailPageCore(context),
        ),
      ),
    );
  }

  Widget buildDetailPageCore(context) {
    final sequelNumber = ModalRoute.of(context)!.settings.arguments;
    final overview =
        'For the $sequelNumber${getSuffix(sequelNumber)} time, palooka '
        'Rocky Balboa fights to be the world heavyweight boxing champion.';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(" "),
        Text(
          overview,
          textScaleFactor: 2.0,
        ),
        ElevatedButton(
          child: Text(
            'Go back',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Switch(
          value: isChanged,
          onChanged: (value) {
            setState(() {
              isChanged = value;
              print(isChanged);
            });
          },
          activeTrackColor: Colors.lightGreenAccent,
          activeColor: Colors.green,
        ),
      ],
    );
  }

  String getSuffix(sequelNumber) {
    String suffix;
    switch (sequelNumber) {
      case 1:
      case 21:
        suffix = 'st';
        break;
      case 2:
      case 22:
        suffix = 'nd';
        break;
      case 3:
      case 23:
        suffix = 'rd';
        break;
      default:
        suffix = 'th';
    }
    return suffix;
  }
}
