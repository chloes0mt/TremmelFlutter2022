/* Stage 4 Requirements Included */
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

const List < String > list = < String > ['Pasta Marinara', 'Cavatelli & Brocoli', 'Butter Noodles', 'Classic Lasagna',
	'Spaghetti Bolognese'
];
const List < String > list2 = < String > ['Mozerella', 'Cheddar', 'Colby Jack', 'Brie', 'Gouda'];

// function to trigger build when the app is run
void main() {
	runApp(MaterialApp(
		initialRoute: '/',
		routes: {
			'/': (context) =>
				const HomeRoute(),
					'/second': (context) =>
					const SecondRoute(),
						'/third': (context) =>
						const ThirdRoute(),
							'/fourth': (context) =>
							const FourthRoute(),
								'/fifth': (context) =>
								const FifthRoute(),
									'/sixth': (context) =>
									const SixthRoute(),
										'/App08Main': (context) =>
										const App08Main()
		},
	)); //MaterialApp
}

class HomeRoute extends StatelessWidget {
	const HomeRoute({
		Key ? key
	}): super(key: key);

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: Scaffold(
				body: Container(
					width: double.infinity,
					height: double.infinity,
					decoration: BoxDecoration(
						image: DecorationImage(
							image: AssetImage("images/foodbackground.jpeg"),
							fit: BoxFit.cover),
					),
					child: Column(
						mainAxisAlignment: MainAxisAlignment.center,
						children: < Widget > [
							const Text("RecipEasy",
									style: TextStyle(
										color: Colors.purple,
										shadows: [
											Shadow( // bottomLeft
												offset: Offset(-1.5, -1.5),
												color: Colors.white,
											),
											Shadow( // bottomRight
												offset: Offset(1.5, -1.5),
												color: Colors.white
											),
											Shadow( // topRight
												offset: Offset(1.5, 1.5),
												color: Colors.white
											),
											Shadow( // topLeft
												offset: Offset(-1.5, 1.5),
												color: Colors.white
											),
										],
										fontSize: 65,
										fontWeight: FontWeight.bold,
										letterSpacing: 2,
									),
								),
								const Divider(),
									const Divider(),
										ElevatedButton(
											child: const Text('Continue'),
												onPressed: () {
													Navigator.pushNamed(context, '/second');
												},
										),
						],
					),
				),
			),
		);
	}
}

class SecondRoute extends StatelessWidget {
	const SecondRoute({
		Key ? key
	}): super(key: key);

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: Scaffold(
				body: Container(
					width: double.infinity,
					height: double.infinity,
					decoration: BoxDecoration(
						image: DecorationImage(
							image: AssetImage("images/foodbackground.jpeg"),
							fit: BoxFit.cover),
					),
					child: Column(
						mainAxisAlignment: MainAxisAlignment.center,
						children: < Widget > [
							Text("Login",
								style: TextStyle(
									color: Colors.purple,
									shadows: [
										Shadow( // bottomLeft
											offset: Offset(-1.5, -1.5),
											color: Colors.white,
										),
										Shadow( // bottomRight
											offset: Offset(1.5, -1.5),
											color: Colors.white
										),
										Shadow( // topRight
											offset: Offset(1.5, 1.5),
											color: Colors.white
										),
										Shadow( // topLeft
											offset: Offset(-1.5, 1.5),
											color: Colors.white
										),
									],
									fontSize: 70,
									fontWeight: FontWeight.bold,
									letterSpacing: 2,
								),
							),
							Text("I am a...", style: TextStyle(color: Colors.purple, fontSize: 35)),
							const Divider(),
								const Divider(),
									ElevatedButton(
										onPressed: () {
											Navigator.pushNamed(context, '/third');
										},
										child: const Text('Administrator'),
											style: ButtonStyle(
												textStyle: MaterialStateProperty.all(
													const TextStyle(fontSize: 50),
												),
											),
									),
									const Divider(),
										const Divider(),
											ElevatedButton(
												onPressed: () {
													Navigator.pushNamed(context, '/third');
												},
												child: const Text('User'),
													style: ButtonStyle(
														textStyle: MaterialStateProperty.all(
															const TextStyle(fontSize: 50),
														),
													),
											),
						],
					),
				),
			),
		);
	}
}

class ThirdRoute extends StatelessWidget {
	const ThirdRoute({
		Key ? key
	}): super(key: key);
	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			body: new Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				mainAxisAlignment: MainAxisAlignment.center,
				children: < Widget > [
					const Padding(
							padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
							child: TextField(
								decoration: InputDecoration(
									border: UnderlineInputBorder(),
									labelText: 'Username',
								),
							),
						),
						Padding(
							padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
								child: TextFormField(
									decoration: const InputDecoration(
										border: UnderlineInputBorder(),
										labelText: 'Password',
									),
								),
						),
						ElevatedButton(
							onPressed: () {
								Navigator.pushNamed(context, '/sixth');
							},
							child: const Text('Login'),
								style: ButtonStyle(
									textStyle: MaterialStateProperty.all(
										const TextStyle(fontSize: 50),
									),
								),
						),
				],
			)
		);
	}
}

class FourthRoute extends StatelessWidget {
	const FourthRoute({
		Key ? key
	}): super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text("Admin Login"),
					backgroundColor: Colors.green,
			), // AppBar
			body: Center(
				child: Column(
					children: < Widget > [
						const Text("Username and password:"),
							ElevatedButton(
								child: const Text('Login'),
									onPressed: () {
										Navigator.pushNamed(context, '/sixth');
									},
							), // ElevatedButton// ElevatedButton
					], // ElevatedButton
				),
			), // Center
		); // Scaffold
	}
}

class FifthRoute extends StatelessWidget {
	const FifthRoute({
		Key ? key
	}): super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text("Login Successful"),
					backgroundColor: Colors.green,
			), // AppBar
			body: Center(
				child: Column(
					children: < Widget > [
						const Text("Click 'Go' to conintue"),
							ElevatedButton(
								child: const Text('Go'),
									onPressed: () {
										Navigator.pushNamed(context, '/sixth');
									},
							), // ElevatedButton// ElevatedButton
					], // ElevatedButton
				),
			), // Center
		); // Scaffold
	}
}

class SixthRoute extends StatelessWidget {
	const SixthRoute({
		Key ? key
	}): super(key: key);

	static
	const String _title = 'What should you cook?';

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

enum animal_protein {
	chicken,
	beef,
	pork,
	venison,
	fish
}

class MyStatefulWidget extends StatefulWidget {
	const MyStatefulWidget({
		super.key
	});

	@override
	State < MyStatefulWidget > createState() => _MyStatefulWidgetState();

}

class _MyStatefulWidgetState extends State < MyStatefulWidget > {
		/* global variables */
		var myController = TextEditingController();
		var myText = '';
		animal_protein ? _meat = animal_protein.chicken;
		double _currentSliderValue = 0;
		bool switchValue = false;
		String dropdownValue = list.first;
		String dropdownValue2 = list2.first;
		final ButtonStyle style =
		ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
		bool _isVisible = false;
		var resultSnack = "";
		var resultSauces = "";
		var resultPasta = "";
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
					children: < Widget > [
						const Divider(),
							const Text(
									"What kind of sauces and/or seasonings do you like to add to your food?"),
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
											textScaleFactor: 1.3,
										),
										DropdownButton < String > (
											value: dropdownValue,
											icon: const Icon(Icons.arrow_downward),
												elevation: 16,
												style: const TextStyle(color: Colors.deepPurple),
													underline: Container(
														height: 2,
														color: Colors.deepPurpleAccent,
													),
													onChanged: (String ? value) {
														// This is called when the user selects an item.
														setState(() {
															dropdownValue = value!;
														});
													},
													items: list.map < DropdownMenuItem < String >> ((String value) {
														return DropdownMenuItem < String > (
															value: value,
															child: Text(value),
														);
													}).toList(),
										),
										Divider(),
										Text("What's your favorite type of animal protein?"),
										ListTile(
											title: Text('Chicken'),
											leading: Radio < animal_protein > (
												value: animal_protein.chicken,
												groupValue: _meat,
												onChanged: (animal_protein ? value) {
													setState(() {
														_meat = value;
													});
												},
											),
										),
										ListTile(
											title: Text('Beef'),
											leading: Radio < animal_protein > (
												value: animal_protein.beef,
												groupValue: _meat,
												onChanged: (animal_protein ? value) {
													setState(() {
														_meat = value;
													});
												},
											),
										),
										ListTile(
											title: Text('Pork'),
											leading: Radio < animal_protein > (
												value: animal_protein.pork,
												groupValue: _meat,
												onChanged: (animal_protein ? value) {
													setState(() {
														_meat = value;
													});
												},
											),
										),
										ListTile(
											title: Text('Venison'),
											leading: Radio < animal_protein > (
												value: animal_protein.venison,
												groupValue: _meat,
												onChanged: (animal_protein ? value) {
													setState(() {
														_meat = value;
													});
												},
											),
										),
										ListTile(
											title: Text('Fish'),
											leading: Radio < animal_protein > (
												value: animal_protein.fish,
												groupValue: _meat,
												onChanged: (animal_protein ? value) {
													setState(() {
														_meat = value;
													});
												},
											),
										),
										const Divider(),
											const Text(
													"Using this slider, indicate how likely you are to have small snacks throughout the day. "),
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
														Switch(
															onChanged: (newValue) {
																setState(() {
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
																child: DropdownButton < String > (
																	value: dropdownValue2,
																	icon: const Icon(Icons.arrow_downward),
																		elevation: 16,
																		style: const TextStyle(color: Colors.deepPurple),
																			underline: Container(
																				height: 2,
																				color: Colors.deepPurpleAccent,
																			),
																			onChanged: (String ? value) {
																				// This is called when the user selects an item.
																				setState(() {
																					dropdownValue2 = value!;
																				});
																			},
																			items: list2.map < DropdownMenuItem < String >> ((String value) {
																				return DropdownMenuItem < String > (
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
															const Divider(),
																Text(
																	'$result',
																	textScaleFactor: 1.3,
																),
																const Divider(),
																	Text(
																		'$resultSauces',
																		textScaleFactor: 1.3,
																	),
																	const Divider(),
																		Text(
																			'$resultPasta',
																			textScaleFactor: 1.3,
																		),
																		const Divider(),
																			Text(
																				'$resultSnack',
																				textScaleFactor: 1.3,
																			),
																			ElevatedButton(
																				child: const Text('Before you go...'),
																					onPressed: () {
																						Navigator.pushNamed(context, '/seventh');
																					},
																			),
					],
				),
			);
		}

		submitSurvey() {
			if (_currentSliderValue <= 4) {
				setState(() =>
					resultSnack =
					"You seem to be a light snacker, which means you consume nutrient-dense meals that keep you "
					" full throughout the day.");
			} else if (_currentSliderValue > 5 && _currentSliderValue < 7) {
				setState(() =>
					resultSnack =
					"It seems you get pretty hungry throughout the day, so you can probably eat a handful of high-protein"
					"$_meat bites used with whatever you have left over.");
			} else {
				setState(() =>
					resultSnack =
					"It looks seems you like to eat A LOT of snacks during the day, "
					"so we recommend making bigger meals so you stay full for as long as possible.");
			}

			if (myText == "None" || myText == "") {
				setState(() =>
					resultSauces = "It seems like you enjoy bland food.");
			} else {
				setState(() =>
					resultSauces = "It looks like you enjoy non-bland, exciting food. We have"
					" a lot of recipes for you that use those sauces and spices!");
			}

			if (dropdownValue == "Pasta Marinara") {
				setState(() =>
					resultPasta =
					"Definitely make a side of penne pasta with savory marinara sauce"
					"to go with whatever we've recommended for you! :) ");
			}

			if (dropdownValue == "Cavatelli & Brocoli") {
				setState(() =>
					resultPasta =
					"It seems you like veggies with your pasta, perhaps you'll like our recipes for"
					" pasta dishes that feature brocoli, asparagus, carrots, or chickpeas!");
			}

			if (dropdownValue == "Butter Noodles") {
				setState(() =>
					resultPasta =
					"It looks like you'd prefer a pasta dish on the plain side. Nothing wrong with that! We have "
					"a few good recipes for pasta noodles with butter (no veggies).");
			}

			if (dropdownValue == "Classic Lasagna") {
				setState(() =>
					resultPasta =
					"It seems you prefer a pasta dish that's hearty, filling, and packed with fluffy ricotta cheese"
					"We have some great recipes for homemade lasagna!");
			}

			if (dropdownValue == "Spaghetti Bolognese") {
				setState(() =>
					resultPasta =
					"You seem to prefer a meaty, high-protein pasta dish. We have many recipes for you!");
			}

			if (switchValue = false) {
				/* chicken dishes (dairy) */
				if (_meat == animal_protein.chicken && dropdownValue2 == "Mozerella") {
					setState(() =>
						result = "For your next meal, we recommend making chicken parmesan.");
				}

				if (_meat == animal_protein.chicken && dropdownValue2 == "Cheddar") {
					setState(() =>
						result = "For your next meal, we recommend you make a grilled "
						"chicken sandwhich with a slide of cheddar cheese.");
				}

				if (_meat == animal_protein.chicken && dropdownValue2 == "Colby Jack") {
					setState(() =>
						result =
						"For your next meal, we recommend you make onion-smothered chicken "
						"covered in colby jack sauce.");
				}

				if (_meat == animal_protein.chicken && dropdownValue2 == "Brie") {
					setState(() =>
						result =
						"For your next meal, we recommend you make pan-seared chicken in a creamy mushroom-brie sauce.");
				}

				if (_meat == animal_protein.chicken && dropdownValue2 == "Gouda") {
					setState(() =>
						result =
						"For your next meal, we recommend you make a baked chicken breast stuffed with gouda and spinach.");
				}
				/* beef dishes (dairy) */
				if (_meat == animal_protein.beef && dropdownValue2 == "Mozerella") {
					setState(() =>
						result = "For your next meal, we recommend making beef meatballs"
						"stuffed with mozzarella cheese.");
				}

				if (_meat == animal_protein.beef && dropdownValue2 == "Cheddar") {
					setState(() =>
						result =
						"For your next meal, we recommend you make a roast beef and cheddar sandwich.");
				}

				if (_meat == animal_protein.beef && dropdownValue2 == "Colby Jack") {
					setState(() =>
						result =
						"For your next meal, we recommend you make a shredded beef enchilada bake with "
						"a creamy colby jack sauce.");
				}

				if (_meat == animal_protein.beef && dropdownValue2 == "Brie") {
					setState(() =>
						result =
						"For your next meal, we recommend you make a hot steak and brie sandwich with cherry tomatoes.");
				}

				if (_meat == animal_protein.beef && dropdownValue2 == "Gouda") {
					setState(() =>
						result =
						"For your next meal, we recommend you make beef chili dip with melted gouda cheese.");
				}
				/* pork dishes (dairy) */
				if (_meat == animal_protein.pork && dropdownValue2 == "Mozerella") {
					setState(() =>
						result = "For your next meal, we recommend making pork cutlet parmesan."
					);
				}

				if (_meat == animal_protein.pork && dropdownValue2 == "Cheddar") {
					setState(() =>
						result =
						"For your next meal, we recommend making pork cutlet sliders with thin "
						"slices of sharp aged cheddar on King's Hawaian Rolls."
					);
				}

				if (_meat == animal_protein.pork &&
					((dropdownValue2 == "Colby Jack") || (dropdownValue2 == "Brie") ||
						(dropdownValue2 == "Gouda"))) {
					setState(() =>
						result =
						"For your next meal, we recommend making carnitas de cerdo. They can be enjoyed with any cheese (not bleu cheese!)."
					);
				}

				if (_meat == animal_protein.venison) {
					setState(() =>
						result =
						"For your next meal, we recommend making venison tenderloin with garlic cream sauce, venison stew, or venison cream-cheese stuffed cresent rolls."
					);
				}
				if (_meat == animal_protein.fish) {
					setState(() =>
						result =
						"For your next meal, we recommend making potato-crusted salmon, tuna steaks, or fried cod."
					);
				}

				/* setState(() => result = "Based on what you answered, we recommend you have $_meat with lots of $myText"
				    " on top or on the side. You may also enjoy a bowl of $dropdownValue. No cheese though, because you're lactose intolerant."
				    " You can snack on $_meat bites $_currentSliderValue times a day if you're feeling peckish."
				); */
			} else if (switchValue = true) {

				/* chicken dishes (dairy) */
				if (_meat == animal_protein.chicken && dropdownValue2 == "Mozerella") {
					setState(() =>
						result = "For your next meal, we recommend making chicken parmesan.");
				}

				if (_meat == animal_protein.chicken && dropdownValue2 == "Cheddar") {
					setState(() =>
						result = "For your next meal, we recommend you make a grilled "
						"chicken sandwhich with a slide of cheddar cheese.");
				}

				if (_meat == animal_protein.chicken && dropdownValue2 == "Colby Jack") {
					setState(() =>
						result =
						"For your next meal, we recommend you make onion-smothered chicken "
						"covered in colby jack sauce.");
				}

				if (_meat == animal_protein.chicken && dropdownValue2 == "Brie") {
					setState(() =>
						result =
						"For your next meal, we recommend you make pan-seared chicken in a creamy mushroom-brie sauce.");
				}

				if (_meat == animal_protein.chicken && dropdownValue2 == "Gouda") {
					setState(() =>
						result =
						"For your next meal, we recommend you make a baked chicken breast stuffed with gouda and spinach.");
				}
				/* beef dishes (dairy) */
				if (_meat == animal_protein.beef && dropdownValue2 == "Mozerella") {
					setState(() =>
						result = "For your next meal, we recommend making beef meatballs"
						"stuffed with mozzarella cheese.");
				}

				if (_meat == animal_protein.beef && dropdownValue2 == "Cheddar") {
					setState(() =>
						result =
						"For your next meal, we recommend you make a roast beef and cheddar sandwich.");
				}

				if (_meat == animal_protein.beef && dropdownValue2 == "Colby Jack") {
					setState(() =>
						result =
						"For your next meal, we recommend you make a shredded beef enchilada bake with "
						"a creamy colby jack sauce.");
				}

				if (_meat == animal_protein.beef && dropdownValue2 == "Brie") {
					setState(() =>
						result =
						"For your next meal, we recommend you make a hot steak and brie sandwich with cherry tomatoes.");
				}

				if (_meat == animal_protein.beef && dropdownValue2 == "Gouda") {
					setState(() =>
						result =
						"For your next meal, we recommend you make beef chili dip with melted gouda cheese.");
				}
				/* pork dishes (dairy) */
				if (_meat == animal_protein.pork && dropdownValue2 == "Mozerella") {
					setState(() =>
						result = "For your next meal, we recommend making pork cutlet parmesan."
					);
				}

				if (_meat == animal_protein.pork && dropdownValue2 == "Cheddar") {
					setState(() =>
						result =
						"For your next meal, we recommend making pork cutlet sliders with thin "
						"slices of sharp aged cheddar on King's Hawaian Rolls."
					);
				}

				if (_meat == animal_protein.pork &&
					((dropdownValue2 == "Colby Jack") || (dropdownValue2 == "Brie") ||
						(dropdownValue2 == "Gouda"))) {
					setState(() =>
						result =
						"For your next meal, we recommend making carnitas de cerdo. They can be enjoyed with any cheese (not bleu cheese!)."
					);
				}

				if (_meat == animal_protein.venison) {
					setState(() =>
						result =
						"For your next meal, we recommend making venison tenderloin with garlic cream sauce, venison stew, or venison cream-cheese stuffed cresent rolls."
					);
				}
				if (_meat == animal_protein.fish) {
					setState(() =>
						result =
						"For your next meal, we recommend making potato-crusted salmon, tuna steaks, or fried cod."
					);
				}
			}
		}

		class App08Main extends StatelessWidget {
			@override
			Widget build(BuildContext context) {
				return MaterialApp(
					home: MovieTitlePage(),
				);
			}
		}

		var rating = 0;
		final review = '';
		final table = 'my_table';


		@override
		initState() {
			super.initState();
			getDatabase(); // initState cannot be async
		}

		Future getDatabase() async {
			String path = "MyDatabase.db";
			_database = await openDatabase(path, version: 1, onCreate: _onCreate);
		}

		Future _onCreate(Database db, int version) async {
			await db.execute(''
				'
				CREATE TABLE $table(
					$columnReview INTEGER PRIMARY KEY,
				)
				''
				');
			}

			class MovieTitlePage extends StatefulWidget {
				@override
				MovieTitlePageState createState() => MovieTitlePageState();
			}

			class MovieTitlePageState extends State < MovieTitlePage > {
				updateRating(String newText) {
					rating = int.parse(newText);
				}

				@override
				Widget build(BuildContext context) {
					return Material(
						child: Column(
							children: < Widget > [
								SizedBox(
									height: 100,
								),
								Text(
									'Marketing Survey',
									textScaleFactor: 5,
								),
								Text(
									'Did you try to make the recipe we suggested to you?'
									'Enter 0 for no and 1 or yes',
									textScaleFactor: 2,
								),
								ElevatedButton(
									child: Text(
										"Submit",
										textScaleFactor: 2,
									),
									onPressed: goToDetailPage(),
									_insert(
										int.parse(_textController.text),
									);
								),
								TextField(
									onChanged: updateRating,
									keyboardType: TextInputType.numberWithOptions(
										signed: false,
										decimal: false,
									),
									decoration: InputDecoration(
										hintText: 'Your answer here',
									),
									style: TextStyle(
										fontSize: 30,
									),
								),
								Text(
									review,
									textScaleFactor: 2.0,
								),
							],
						),
					);
				}

				goToDetailPage() async {
					await Navigator.push(
						context,
						MaterialPageRoute(
							builder: (context) => DetailPage(),
						),
					);
					setState(() {});
				}
			}

			class DetailPage extends StatelessWidget {
				final overview = 'Thank you for participating in this survey!';

				@override
				Widget build(BuildContext context) {
					return Material(
						child: Column(
							children: [
								SizedBox(
									height: 100,
								),
								Text(
									overview,
								),
								ElevatedButton(
									child: Text(
										"Logout",
										textScaleFactor: 2,
									),
									onPressed: () => Navigator.pop(context),
								),
								Text(
									'Response: $rating',
									textScaleFactor: 2,
								),
								ElevatedButton(
									onPressed: () {},
									child: Text(
										"View responses",
										textScaleFactor: 2,
									),
								),
							],
						),
					);
				}

				Future < void > _displayTextInputDialog(BuildContext context) async {
					return showDialog(
						context: context,
						builder: (context) {
							return AlertDialog(
								title: Text('You need to be an administrator to access this section:'
									' Please enter the password: '),
								content: TextField(
									onChanged: (value) {
										setState(() {
											valueText = value;
										});
									},
									controller: _textFieldController,
									decoration: InputDecoration(hintText: "Password"),
								),
								actions: < Widget > [
									ElevatedButton(
										child: Colors.green,
										textColor: Colors.white,
										child: Text('OK'),
										onPressed: () {
											setState(() {
												codeDialog = valueText;
												if (_textFieldController == "admin") {
													read() async {
														var allRows = await database.query('my_table');
														results = '';
														setState(() => allRows.forEach((row) => results += '\n$row'));
													}
												}
											});
										},
									),

								],
							);
						});
				}

				changeText(newText) {
					setState(() => myText = newText);
				}
			}
