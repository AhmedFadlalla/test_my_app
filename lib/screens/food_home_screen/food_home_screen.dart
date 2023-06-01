import 'package:flutter/material.dart';

import '../../models/food_model.dart';
import 'component/custom_item_container/custom_item_container.dart';
class FoodHomeScreen extends StatefulWidget {
   FoodHomeScreen({Key? key}) : super(key: key);

  @override
  State<FoodHomeScreen> createState() => _FoodHomeScreenState();
}

class _FoodHomeScreenState extends State<FoodHomeScreen> {
  Map<String,dynamic> map={
    "name":"Ahmed"
  };

  Map<int,dynamic> data={
   0:[
      FoodModel(id: 0,
          image: "assets/images/burger.png",name: "Burger", price: 35, description: "Burger With souse"),
      FoodModel(id: 1,image: "assets/images/burger.png", name: "Burger white", price: 35, description: "Burger With white souse"),
      FoodModel(id: 2,image: "assets/images/burger.png", name: "Burger black", price: 35, description: "Burger With white souse"),
      FoodModel(id: 3,image: "assets/images/burger.png", name: "Burger union", price: 35, description: "Burger With souse"),
      FoodModel(id: 4, image: "assets/images/burger.png",name: "Burger clash", price: 35, description: "Burger With souse"),
    ],
    1:[
      FoodModel(id: 0,image: "assets/images/pizaa.jpg", name: "Pizza", price: 35, description: "Pizza With souse"),
      FoodModel(id: 1,image: "assets/images/pizaa.jpg", name: "Pizza mashroom", price: 35, description: "Pizza With white souse"),
      FoodModel(id: 2,image: "assets/images/pizaa.jpg", name: "Pizza piproni", price: 35, description: "Pizza With white souse"),
      FoodModel(id: 3,image: "assets/images/pizaa.jpg", name: "Pizza thin", price: 35, description: "Pizza With souse"),
      FoodModel(id: 4,image: "assets/images/pizaa.jpg", name: "Pizza Italian", price: 35, description: "Burger With souse"),
    ],

  };

  int currentIndex=0;

  List<String> categories=[
    "Burger",
    "Pizza",
  ];

  @override
  Widget build(BuildContext context) {
    print(data[currentIndex]);
    return Scaffold(

     // drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 22,
        leading:InkWell(
          onTap: (){

          },
            child: Icon(Icons.menu,color: Colors.yellow,)),
        title: Text("Home",style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),),
        actions: [
          Icon(Icons.notifications,color: Colors.yellow,size: 20,),
          SizedBox(width: 8,),
          CircleAvatar(
            backgroundColor: Colors.yellow,
            radius: 12,
            child: Icon(Icons.add_shopping_cart,size: 12,),
          ),
          SizedBox(width: 8,),

          CircleAvatar(
            radius: 12,
            backgroundImage: Image.asset("assets/images/man.jpg",

              fit: BoxFit.fill,
            ).image,
          ),

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("OverView",style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 8,),
              Text("Hello Ahmed",style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
                fontWeight: FontWeight.normal
              ),),
              SizedBox(height: 8,),
              Container(
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25)
                ),
                child: TextFormField(
                  decoration:InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.filter_list),
                    hintText: "Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                         color: Colors.white
                      )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                            color: Colors.white
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                            color: Colors.white
                        )
                    )
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Container(
                height: 60,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index)=>InkWell(
                      onTap: (){

                        setState(() {

                          currentIndex=index;
                        });
                      },
                      child: Container(
                        child: Column(
                          children: [
                            Icon(Icons.account_circle_rounded,size:28),
                            Text(categories[index],style: TextStyle(
                                fontSize: 22,
                                color: Colors.grey
                            ),)
                          ],
                        ),
                      ),
                    ),
                    separatorBuilder:  (context,index)=>SizedBox(width: 5,),
                    itemCount: categories.length),
              ),
              GridView.count(
                shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  childAspectRatio: 9/14,
                  crossAxisCount:3,
                crossAxisSpacing: 8,
                children: List.generate(5, (index) => CustomItemContainer(
                    model: data[currentIndex][index]),),
              )

            ],
          ),
        ),
      ),
    );
  }
}
