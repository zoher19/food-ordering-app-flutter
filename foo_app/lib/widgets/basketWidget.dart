
import 'package:flutter/material.dart';
import 'package:foo_app/moduls/order_moduls.dart';
import 'package:foo_app/pages/OrderPage.dart';


class BasketOrder extends StatefulWidget {
  VoidCallback? onUpdate;
   BasketOrder({super.key,this.onUpdate});

  @override
  State<BasketOrder> createState() => _BasketOrderState();
}

class _BasketOrderState extends State<BasketOrder> {
  String checkOnOrders(){

      if(order.items.isNotEmpty)
      {
        return order.items.length.toString();
      }

    return "0";
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetails(order: order))).then((value){
          widget.onUpdate!.call();
          });},
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.secondary,
                  blurRadius: 2,
                )
              ]
            ),
            child: Icon(Icons.shopping_cart_rounded,color: Colors.white,size:36),
          ),
        ),
        

        Positioned(
            left: 40,
            bottom: 35,
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Text(checkOnOrders(),style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white),),
            ),
          )
      ],
    );
  }
}