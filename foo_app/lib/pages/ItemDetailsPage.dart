import 'package:flutter/material.dart';
import 'package:foo_app/moduls/ListOfOrders.dart';
import 'package:foo_app/moduls/favoriteItem_moduls.dart';
import 'package:foo_app/moduls/item_models.dart';
import 'package:foo_app/moduls/order_moduls.dart';
import 'package:foo_app/widgets/CounterWidget.dart';
import 'package:foo_app/widgets/FavoriteWidget.dart';

class ItemDetailsPage extends StatefulWidget {
  final Item item;

  const ItemDetailsPage({super.key, required this.item});

  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  int counter = 1;

  double calculatePrice() {
    return counter * widget.item.price;
  }

  Widget CustomeDes(String title,String des){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title,style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey,fontWeight: FontWeight.bold),),
        Text(des,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B2B2B),
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:30.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2B2B2B),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.asset(
                    widget.item.imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                top: 24,
                left: 8,
                child: IconButton(
                  icon: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.secondary,
                        blurRadius: 8,
                      )
                    ]
                    ),
                    child:  Icon(Icons.arrow_back_ios_rounded, size: 32,color:Theme.of(context).colorScheme.secondary,)),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Positioned(
                top: 24,
                right: 8,
                child: Container(
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.secondary,
                        blurRadius: 8,
                      )
                    ],
                  )
                  ,child: Favoritewidget(fItem:clsFavoriteItem(item: widget.item, person: person))),
              ),
            ],
          ),

          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.secondary,
                    blurRadius: 30,
                    spreadRadius: 6,
                  )
                ]
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.item.name,
                            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),

                              const SizedBox(height: 32),
                          Row(
                            children: [
                              ImageIcon(AssetImage("assets/drink.png"),color: Theme.of(context).colorScheme.secondary,),
                          
                              SizedBox(width: 4,),
                              Text(
                                     "Category :",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                  ),

                              SizedBox(width: 4,),
                          
                              Image.asset(widget.item.category.ImgUrl,height: 20,),

                              SizedBox(width: 4,),
                              
                              Text(
                                     widget.item.category.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                  ),
                            ],
                          ),
                          const SizedBox(height: 32),
            
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                            CustomeDes("Calories", "${widget.item.colliery} Kcal"),
                            SizedBox(width: 20,),
                            Container(color: Colors.grey,height: 40,width: 2,),
                            SizedBox(width: 20,),
                            CustomeDes("Rating", "${widget.item.rating}"),
                            Icon(Icons.star,color: Colors.amber,size: 30,)
                          ],),
                          
                          const SizedBox(height: 20),
            
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Quantity : ",
                                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              CounterWidget(
                                counter: counter,
                                onChanged: (val) {
                                  setState(() {
                                     counter=val;
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Description:",
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              widget.item.description == null? "No Description": widget.item.description.toString(),
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.black87,
                                  ),
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
            
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${calculatePrice()} \$",
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 4,
                            backgroundColor: Theme.of(context).colorScheme.secondary,
                            foregroundColor: Colors.white,
                            minimumSize: const Size(130, 50),
                            textStyle: const TextStyle(fontSize: 18),
                          ),
                          onPressed: () {

                            ScaffoldMessenger.of(context).showSnackBar(
                               SnackBar(
                                content: Text("Added to cart",style: Theme.of(context).textTheme.titleLarge,),
                                duration: Duration(seconds: 1,),
                                backgroundColor: Theme.of(context).colorScheme.secondary,

                                ),
                            );

                            for (int i = 0; i < counter; i++)
                             {
                                order.items.add(widget.item);
                             }

                         var newOrders=orders.where((o)=>o.id == order.id);
                          if(newOrders.isEmpty)
                          {
                            order.person=person;
                            orders.add(order);
                          }
                             Navigator.pop(context);
                          },
                          child: const Text("Checkout"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
