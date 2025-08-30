import 'package:flutter/material.dart';
import 'package:foo_app/moduls/ListOfFavoriteItem.dart';

class CounterWidget extends StatefulWidget {
   int  counter=1;
   final ValueChanged<int> onChanged;
   CounterWidget({super.key,required this.counter,required this.onChanged});


  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {

  
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: MediaQuery.of(context).size.width * 0.26,
         decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(16)
        ),
         child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
              IconButton(
            onPressed: (){setState(() {
              if(widget.counter > 1)
             { widget.counter--;}
             widget.onChanged(widget.counter);
          });},
           icon: Icon(Icons.remove,size: 22,color: Colors.white,)),
                                     
          Text(widget.counter.toString(),style:Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white,fontWeight: FontWeight.bold)),
          
          IconButton(
            onPressed: (){setState(() {
            widget.counter++;
            widget.onChanged(widget.counter);
          });},
           icon: Icon(Icons.add,size: 22,color: Colors.white,),
           ),
         
         ],),
    );
  }
}