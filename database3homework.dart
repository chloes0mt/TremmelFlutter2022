import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

// Don't forget to import 'package:sqflite/sqflite.dart' and put sqflite:  in pubspec.yaml

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class Person {
  String name;
  int age;

  Person(this.name, this.age);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
    };
  }
}

class MyHomePageState extends State<MyHomePage> {
  late Database database;

  var idController = TextEditingController();
  var nameController = TextEditingController();
  var ageController = TextEditingController();

  var results = '';

  @override
  initState() {
    super.initState();
    getDatabase(); // initState cannot be async
  }

  Future getDatabase() async {
    database =
    await openDatabase('MyDatabase.db', version: 1, onCreate: onCreate);
  }

  Future onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE my_table (
            _id INTEGER PRIMARY KEY,
            name TEXT NOT NULL,
            age INTEGER NOT NULL
          )
          ''');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: nameController,
                style: TextStyle(fontSize: 30),
                decoration: InputDecoration(hintText: 'Name'),
              ),
              SizedBox(width: 10.0),
              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 30),
                decoration: InputDecoration(hintText: 'Age'),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                child: Text(
                  'Create',
                  textScaleFactor: 2,
                ),
                onPressed: () {
                  create(
                    Person(
                      nameController.text,
                      int.parse(ageController.text),
                    ),
                  );
                  nameController.clear();
                  ageController.clear();
                },
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                child: Text(
                  'Read',
                  textScaleFactor: 2,
                ),
                onPressed: read,
              ),
              TextField(
                controller: idController,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 30,
                ),
                decoration: InputDecoration(
                  hintText: 'id',
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text(
                      'Update',
                      textScaleFactor: 2,
                    ),
                    onPressed: () {
                      update(
                        int.parse(idController.text),
                        Person(
                          nameController.text,
                          int.parse(ageController.text),
                        ),
                      );
                      nameController.clear();
                      ageController.clear();
                    },
                  ),
                  ElevatedButton(
                    child: Text(
                      'Delete',
                      textScaleFactor: 2,
                    ),
                    onPressed: () {
                      delete(int.parse(idController.text));
                      idController.clear();
                    },
                  ),
                  ElevatedButton(
                    child: Text(
                      'Delete First Row',
                      textScaleFactor: 2,
                    ),
                    onPressed: () {
                      deleteFirstRow(int.parse(idController.text));
                      idController.clear();
                    },
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    results,
                    textScaleFactor: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  create(person) async {
    var _id = await database.insert(
      'my_table',
      person.toMap(),
    );
    setState(() => results = 'inserted row with id $_id');
  }

  read() async {
    var allRows = await database.query('my_table');
    results = '';
    setState(() => allRows.forEach((row) => results += '\n$row'));
  }

  update(_id, person) async {
    var rowsUpdated = await database
        .update('my_table', person.toMap(), where: '_id = ?', whereArgs: [_id]);

    print('$rowsUpdated');
    setState(() => results = 'updated row with id $_id');
  }

  delete(_id) async {
    var rowsDeleted =
    await database.delete('my_table', where: '_id = ?', whereArgs: [_id]);

    print('$rowsDeleted');
    setState(() => results = 'deleted row with id $_id');
  }

  deleteFirstRow(_id) async {
    var rowsDeleted =
    await database.delete('my_table', where: '_id = ?', whereArgs: [_id]);

    print('$rowsDeleted');
    setState(() => results = 'deleted row with id $_id');
  }

/*  updateRaw(_id, Person person) async {
    var nameSetter = person.name.isEmpty ? '' : 'name = ?' ;
    var separator = person.name.isEmpty || person.age. != null ? ',' : '';
    // checking for empty Age textfield makes this overly complicated
    var ageSetter = person.age != null ? 'age = ?' : '';
    await database.rawUpdate(
        'UPDATE my_table SET $nameSetter $separator $ageSetter WHERE _id = ?', _id);
    setState(() => results = 'updated row with id $_id');
  }*/
}
