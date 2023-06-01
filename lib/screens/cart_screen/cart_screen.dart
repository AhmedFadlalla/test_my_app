import 'package:flutter/material.dart';
import 'package:food_app/models/food_model.dart';



class CartScreen extends StatefulWidget {
  final FoodModel model;
  final String text;
  const CartScreen({Key? key,
  required this.model,
  required this.text}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  int counter=1;
  double price=0.0;
  @override
  Widget build(BuildContext context) {
    price=widget.model.price;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(widget.model.image)),
            Text(widget.model.name),
            Text(widget.text),
            Text("${widget.model.price}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){
                  setState(() {
                    counter++;
                    price*=counter;
                  });
                }, icon: Icon(Icons.add)),
                Text("${price}"),
                IconButton(onPressed: (){
                  setState(() {
                    counter--;
                    price*=counter;
                  });
                }, icon: Icon(Icons.minimize)),

              ],
            )

          ],
        ),
      ),
    );
  }
}
