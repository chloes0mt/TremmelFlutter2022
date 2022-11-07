import 'package:flutter/material.dart';
import 'dart:collection';
/* I think I had the right idea to make an array of Movie objects and looping through them
but implementing it exactly how the app was supposed to was where I got stuck */

void main() => runApp(App08Main());

class App08Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MovieTitlePage(),
    );
  }
}

class Movie {
  int index = 0;
  bool like = false;

  Movie(
      this.index,
      this.like,
      );

  List<Movie> movie_titles = [];
  for (var i = 0; i < total(movie_titles); i++) {
    Text("$i");
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
          child: buildTitlePageCore(),
        ),
      ),
    );
  }

  goToDetailPage(int index) async {
    var newRating = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(),
        settings: RouteSettings(
          arguments: Movie(
            index,
            rating[index - 1],
          ),
        ),
      ),
    );
    rating[index - 1] = newRating;
    ratingKnown[index - 1] = true;
    setState(() {});
  }

  var rating = List.filled(100, false);
  var ratingKnown = List.filled(100, false);

  Widget buildTitlePageCore() {
    return ListView.builder(
      itemCount: 25,
      itemBuilder: (context, int index) => ListTile(
        title: Row(
          children: [
            Icon(
              ratingKnown[index]
                  ? (rating[index] ? Icons.thumb_up : Icons.thumb_down)
                  : Icons.question_mark,
            ),
            Text(
              '      Rocky ${index + 1}',
              textScaleFactor: 2.0,
            ),
          ],
        ),
        onTap: () => goToDetailPage(index + 1),
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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

  var switchState = false;
  var fromMainPage = true;

  setSwitch(newValue) {
    fromMainPage = false;
    setState(() {
      switchState = newValue;
    });
  }

  Widget buildDetailPageCore(context) {
    var args = ModalRoute.of(context)!.settings.arguments as Movie;
    var sequelNumber = args.index;
    if (fromMainPage) switchState = args.like;
    final overview =
        'For the $sequelNumber${getSuffix(sequelNumber as int)} time, palooka '
        'Rocky Balboa fights to be the world heavyweight boxing champion.';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          overview,
          textScaleFactor: 2.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Did you like it?',
              textScaleFactor: 1.5,
            ),
            Switch(
              onChanged: setSwitch,
              value: switchState,
            ),
            Text(
              switchState ? "Yes" : "No",
              textScaleFactor: 1.5,
            ),
          ],
        ),
        ElevatedButton(
          child: Text(
            'Go Back',
            textScaleFactor: 1.5,
          ),
          onPressed: () => Navigator.pop(context, switchState),
        ),
      ],
    );
  }

  String getSuffix(int sequelNumber) {
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
