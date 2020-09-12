import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:happy_meals_food_delivery_app/widgets/build_card.dart';
import 'constants/constants.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(
              Icons.menu,
              color: Colors.black,
              size: 28,
            ),
          ),
        ],
      ),
      floatingActionButton: CircleAvatar(
        radius: 40,
        backgroundColor: kPimaryColorL,
        child: FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add),
          backgroundColor: kPimaryColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 60, top: 15, bottom: 15),
                child: Text(
                  'Simple way to find tasty food',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Container(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    BuildCategory(
                      category: 'all',
                    ),
                    BuildCategory(
                      category: 'Italian',
                    ),
                    BuildCategory(
                      category: 'Asian',
                    ),
                    BuildCategory(
                      category: 'Mexican',
                    ),
                    BuildCategory(
                      category: 'Chinese',
                    ),
                    BuildCategory(
                      category: 'Japanese',
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(width: 1, color: Colors.grey[400])),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 400,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    BuildCard(
                      tag: 'hh',
                      price: '20',
                      dishName: 'Vegal Salad Bowl',
                      imgPath: 'assets/images/1.jpg',
                    ),
                    BuildCard(
                      tag: 'dds',
                      price: '35',
                      dishName: 'Vegal Salad Bowl',
                      imgPath: 'assets/images/1.jpg',
                    ),
                    BuildCard(
                      tag: 'sads',
                      price: '40',
                      dishName: 'Vegal Salad Bowl',
                      imgPath: 'assets/images/1.jpg',
                    ),
                    BuildCard(
                      tag: 'shd',
                      price: '30',
                      dishName: 'Vegal Salad Bowl',
                      imgPath: 'assets/images/1.jpg',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildCategory extends StatelessWidget {
  final String category;
  BuildCategory({this.category});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 50,
        child: Text(
          category,
          style: TextStyle(
              fontSize: 20, color: kPimaryColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
