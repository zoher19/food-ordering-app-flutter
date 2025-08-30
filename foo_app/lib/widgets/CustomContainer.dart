import 'package:flutter/material.dart';
import 'package:foo_app/moduls/ListOfFavoriteItem.dart';
import 'package:foo_app/moduls/order_moduls.dart';

class CustomContainerForFavoriteFood extends StatefulWidget {
  final VoidCallback onNavigateToSaved;
   CustomContainerForFavoriteFood({super.key,required this.onNavigateToSaved});

  @override
  State<CustomContainerForFavoriteFood> createState() => _CustomContainerForFavoriteFoodState();
}

class _CustomContainerForFavoriteFoodState extends State<CustomContainerForFavoriteFood> {
  
   bool isThereAnyFavoriteItem(){
    return favoriteItems.where((f)=>f.person.id == person.id).toList().isNotEmpty;
   }

   IconData changeIcon(){
    return isThereAnyFavoriteItem() ? Icons.favorite:Icons.favorite_outline_rounded;
   }  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.secondary,
            blurRadius: 4,
          )
        ]
      ),
      child: Stack(
        children: [
          IconButton(
            onPressed: (){
            widget.onNavigateToSaved.call();
          }, icon: Icon(changeIcon(),size: 32,color: Theme.of(context).colorScheme.secondary,)),
          if(isThereAnyFavoriteItem())
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              shape: BoxShape.circle,
            ),
            child: Text(favoriteItems.where((f)=>f.person.id == person.id).toList().length.toString(),style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
          
          )
        ],
      ),

    );
  }
}