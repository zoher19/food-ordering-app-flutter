import 'package:flutter/material.dart';
import 'package:foo_app/moduls/ListOfFavoriteItem.dart';
import 'package:foo_app/moduls/ListOfOrders.dart';
import 'package:foo_app/moduls/order_moduls.dart';
import 'package:foo_app/widgets/BestOrderContainer.dart';
import 'package:foo_app/widgets/CustomContainer.dart';
import 'package:foo_app/widgets/basketWidget.dart';


class Saveditempage extends StatefulWidget {
  const Saveditempage({super.key});

  @override
  State<Saveditempage> createState() => _SaveditempageState();
}

class _SaveditempageState extends State<Saveditempage> {

  Widget getFavoriteItems(){
    var userFavorites=favoriteItems.where((favoriteItem)=>favoriteItem.person.id == person.id).toList();
    return ListView.builder(
      itemCount: userFavorites.length,
      itemBuilder: (context,index)=> Bestordercontainer(item: userFavorites[index].item,onFavoriteChanged: (){setState(() {
        
      });},onItemsChanged: (){setState(() {
        
      });},),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      );
  }

  Widget favoritePageItem(){
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                   Text("Your Favorite Foods",style:Theme.of(context).textTheme.headlineSmall!.copyWith(color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.bold)),
                    Spacer(),
                    CustomContainerForFavoriteFood(onNavigateToSaved: (){},),
                  ],
                ),
              ),
              
              Expanded(
                child: SingleChildScrollView(
                child:Column(children: [
                    getFavoriteItems(),
                ],)
              ))
             
          ],
        ),

        if(orders.isNotEmpty)
        if(order.items.isNotEmpty)
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(alignment: Alignment.bottomRight,child: BasketOrder()),
        ),
      ],
    );
  }

  Widget noFavoriteItem(){
    return Center(
      child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageIcon(
              AssetImage("assets/images/touch.png",),
              size: 200,
              color: Theme.of(context).colorScheme.secondary,
          ),
          Text("There is no favorite food",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return 
      SafeArea(
        child: favoriteItems.where((favoriteItem)=>favoriteItem.person.id == person.id).toList().isEmpty ? noFavoriteItem() : favoritePageItem(),
      );
    
  }
}