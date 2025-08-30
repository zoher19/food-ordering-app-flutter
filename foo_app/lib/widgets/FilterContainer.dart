import 'package:flutter/material.dart';
import 'package:foo_app/moduls/Categor_moduls.dart';

class Filtercontainer extends StatelessWidget {
  final Category category;
  final bool isSelected;
  final VoidCallback? onTap;

   Filtercontainer({super.key, required this.category,required this.isSelected,this.onTap});



  @override
  Widget build(BuildContext context) {
      Color clr=isSelected?Theme.of(context).colorScheme.secondary:Colors.white;
      Color fontClr=isSelected?Colors.white:Colors.black;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4),
        margin: EdgeInsets.all(4),
        width: MediaQuery.of(context).size.width*0.3,
        decoration: BoxDecoration(
          color: clr,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.secondary,
              blurRadius: 4,
      
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset( category.ImgUrl,height: 25,),
            Text(category.title,style:Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold,color:fontClr)),       
        ],),
      ),
      
      
    );
  }
}