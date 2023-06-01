import 'package:flutter/material.dart';
import 'package:food_app/models/food_model.dart';
import 'package:food_app/screens/cart_screen/cart_screen.dart';

class ItemDetailsScreen extends StatelessWidget {
  final FoodModel model;
  const ItemDetailsScreen({Key? key,
  required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(model.image)),
            Text(model.name),
            Text(model.description),
            Text(model.price.toString()),
            Container(
              color: Colors.blue,
              child: MaterialButton(
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen(model: model,text: "Cart",)));
              },
              child: Text("Cart"),),
            )

          ],
        ),
      ),
    );
  }
}
