import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'food_court_cart.dart';
import 'model_class/meal_model_class.dart';
import 'model_class/order_breakfast.dart';

class Bakery extends StatefulWidget {
  const Bakery({Key? key}) : super(key: key);

  @override
  State<Bakery> createState() => _BakeryState();
}

class _BakeryState extends State<Bakery> {
  List _foodListBreakfast = [];
  Future<void> jsonBreakfast() async {
    final String response =
        await rootBundle.loadString('assets/json/breakfast.json');
    final data = await json.decode(response);
    // final List parsedList = json.decode(response);

    setState(() {
      _foodListBreakfast = data["items"];
      // print(" sath::${_foodListBreakfast}");
    });
  }

  Future<void> jsonLunch() async {
    final String response =
        await rootBundle.loadString('assets/json/lunch.json');
    final data = await json.decode(response);

    setState(() {
      _foodListBreakfast = data["items"];
      // print(" sath::${_foodListBreakfast}");
    });
  }

  Future<void> jsonSnacks() async {
    final String response =
        await rootBundle.loadString('assets/json/snacks.json');
    final data = await json.decode(response);

    setState(() {
      _foodListBreakfast = data["items"];
      // print(" sath::${_foodListBreakfast}");
    });
  }

  List bakeryItems = ["Snacks", "Pastries", "Bakery"];
  List foodType = [
    "assets/images/vegetarian.jpg",
    "assets/images/nonveg.jpg",
    "assets/images/nonveg.jpg",
    "assets/images/vegetarian.jpg",
    "assets/images/nonveg.jpg"
  ];

  List foodPrice = ["₹150", "₹280", "₹200", "₹180", "₹300"];
  bool isSwitch = true;
  List<MealType> mealTypes = [];
  @override
  void initState() {
    jsonBreakfast();
    setMealListValues();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Text("Menu"),
          backgroundColor: Colors.teal,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.search_outlined,
                        color: Colors.black26,
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ],
              ),
              // ),SizedBox(width: 60,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Home Bakers",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      bakeryItems.toString(),
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "LB Nagar Main Road, Chaitanyapuri",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orangeAccent,
                          size: 30,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text("4.5",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 20)),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "(1000+ ratings)",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                              fontSize: 10),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.access_alarm_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "10-15 min",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 170,
                        ),
                        Text(
                          "Veg only",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Switch(
                          inactiveThumbColor: Colors.orangeAccent,
                          activeColor: Colors.white,
                          // inactiveTrackColor: Colors.white70,
                          activeTrackColor: Colors.orangeAccent,
                          value: isSwitch,
                          onChanged: (value) {
                            setState(() {
                              isSwitch = value;
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                height: 50,
                width: 500,
                // color: Colors.yellow,
                // child: Text("test"),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: mealTypes.length,
                  itemBuilder: (BuildContext context, index) {
                    return Column(
                      children: [
                        InkWell(
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(10),
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.teal),
                                color: mealTypes[index].isSelectedMeal
                                    ? Colors.teal
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                mealTypes[index].title,
                                style: TextStyle(
                                    color: mealTypes[index].isSelectedMeal
                                        ? Colors.black
                                        : Colors.teal),
                              ),
                            ),
                          ),
                          onTap: () {
                            print("${mealTypes[index].title}");

                            setState(() {
                              if (mealTypes[index].title == "Breakfast") {
                                jsonBreakfast();
                              } else if (mealTypes[index].title == "Lunch") {
                                jsonLunch();
                              } else if (mealTypes[index].title == "Snacks") {
                                jsonSnacks();
                              }
                              for (int i = 0; i < mealTypes.length; i++) {
                                mealTypes[i].isSelectedMeal = false;
                              }
                              mealTypes[index].isSelectedMeal = true;
                            });
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Recommended",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 170,
                  ),
                  Icon(Icons.arrow_drop_down_sharp)
                ],
              ),
              Container(
                height: 540,
                width: 450,
                // color: Colors.teal,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: _foodListBreakfast.length,
                    // itemCount:1,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 100,
                            // width: 150,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 1,
                                ),
                              ],
                              color: Colors.white,
                              border: Border.all(color: Colors.black26),
                            ),
                            child: Column(
                              // crossAxisAlignment:CrossAxisAlignment.start ,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      "assets/images/food.jpg",
                                      height: 80,
                                      width: 100,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Image.asset(
                                              _foodListBreakfast[index]
                                                  ["image"],
                                              height: 10,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(_foodListBreakfast[index]
                                                ["itemName"])
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "₹ ${_foodListBreakfast[index]["price"].toString()}",
                                              ),
                                            ),
                                            SizedBox(
                                              width: 130,
                                            ),
                                            TextButton(
                                                style: TextButton.styleFrom(
                                                  side: const BorderSide(
                                                      width: 2,
                                                      color: Colors.amber),
                                                  // shape:OutlineInputBorder(borderRadius: ),
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              FoodCourtCart()));
                                                },
                                                child: Text(
                                                  "Add",
                                                  style: TextStyle(
                                                      color:
                                                          Colors.amberAccent),
                                                ))
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            )),
                      );
                    }),
              ),
            ],
          ),
        ));
  }

  setMealListValues() {
    MealType mealTypes1 = MealType(title: 'Breakfast', isSelectedMeal: true);
    mealTypes.add(mealTypes1);
    MealType mealTypes2 = MealType(title: 'Lunch', isSelectedMeal: false);
    mealTypes.add(mealTypes2);
    MealType mealTypes3 = MealType(title: 'Snacks', isSelectedMeal: false);
    mealTypes.add(mealTypes3);
    MealType mealTypes4 = MealType(title: 'Dinner', isSelectedMeal: false);
    mealTypes.add(mealTypes4);
  }
}
