
import 'package:flutter/material.dart';
import 'package:foo_app/moduls/ListOfFavoriteItem.dart';
import 'package:foo_app/moduls/favoriteItem_moduls.dart';
import 'package:foo_app/moduls/order_moduls.dart';

class Favoritewidget extends StatefulWidget {
  final clsFavoriteItem fItem;
  final VoidCallback? onFavoriteChanged;
  const Favoritewidget({super.key,required this.fItem,this.onFavoriteChanged});

  @override
  State<Favoritewidget> createState() => _FavoritewidgetState();
}

class _FavoritewidgetState extends State<Favoritewidget> {
   

var IsItemExists=[];
  IconData checkOnIcon(IconData icon){
    if(icon == Icons.favorite_outline_rounded)
    {
      return Icons.favorite_rounded;
    }
    else
    {
      return Icons.favorite_outline_rounded;
    }
  }

  Color checkOnColor(Color clr){
    final secondaryclr=Theme.of(context).colorScheme.secondary;
    if(clr==secondaryclr)
      {return Colors.red;}
    else
      {return secondaryclr;}
  }
 
  bool checkOnFavoriteItem(){
     IsItemExists=favoriteItems.where((f)=>((f.item.id == widget.fItem.item.id) && (f.person.id ==person.id))).toList();
    return IsItemExists.isNotEmpty;
  }
  
  void setFavoriteItem(){
    if(checkOnFavoriteItem())
       {
        favoriteItems.removeWhere((f) => f.item.id == widget.fItem.item.id);
       }
    else
      {favoriteItems.add(widget.fItem);}   
  }
  
  @override
  Widget build(BuildContext context) {
   IconData icon= checkOnFavoriteItem()?Icons.favorite_rounded:Icons.favorite_outline_rounded;
   Color clr=Theme.of(context).colorScheme.secondary;

    return IconButton(
      onPressed: (){
        setState(() {
          icon=checkOnIcon(icon);
          clr=checkOnColor(clr);
          setFavoriteItem();
        if(widget.onFavoriteChanged!=null)
              {widget.onFavoriteChanged!.call();}
          
        });
      },
    
      icon: Icon(icon,color: clr,size:30)
      );
  }
}