import 'package:flutter/material.dart';
import 'package:happy_meals_food_delivery_app/constants/constants.dart';
import 'package:happy_meals_food_delivery_app/dish_details.dart';

class BuildCard extends StatelessWidget {
  final String imgPath;
  final String price;
  final String dishName;
  final String tag;
  BuildCard({this.imgPath, this.price, this.dishName, @required this.tag});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DishDetails()));
        },
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: kPimaryColorL,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '\$ $price',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: kPimaryColor),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Text(
                        dishName,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        'with red tomato',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      Text(
                          'sjgjsgasgdkjasb ska dkasd kasdk askd jkashdakshdkas dk ksagdkgs',
                          style: TextStyle(height: 2)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text('data'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imgPath),
                  ),
                  borderRadius: BorderRadius.circular(180),
                  boxShadow: [
                    BoxShadow(color: kPimaryColor, offset: Offset(15, 15))
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
