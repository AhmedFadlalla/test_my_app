import 'package:flutter/material.dart';
import 'package:food_app/models/food_model.dart';
import 'package:food_app/screens/item_details/item_details_screen.dart';
class CustomItemContainer extends StatelessWidget {
  final FoodModel model;
  const CustomItemContainer({Key? key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>ItemDetailsScreen(model: model,)));
      },
      child: Container(
        //  color:Colors.red,
        child: Column(
          children: [
            Image(
              image: AssetImage(model.image),
            ),
            Text(model.name,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),),
            Text(model.description,style: TextStyle(
                color: Colors.grey,
              fontSize: 14
            ),),
            Text("${model.price}\$",
                style: TextStyle(
                    color: Colors.red
                )),
          ],
        ),
      ),
    );
  }
}
