

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:foo_app/moduls/ListOfOrders.dart';
import 'package:foo_app/moduls/order_moduls.dart';
import 'package:foo_app/pages/OrderPage.dart';

class LastOrderWidget extends StatefulWidget {
  final clsOrder order;
  VoidCallback? onDeleted;

  LastOrderWidget({super.key, required this.order,this.onDeleted});

  @override
  State<LastOrderWidget> createState() => _LastOrderWidgetState();
}

class _LastOrderWidgetState extends State<LastOrderWidget> {
  late clsOrder reelOrder;

  String orderStateText = "";
  Color clrOrderState = Colors.amber;

  String isSureText = "";
  Color clrIsSureText = Colors.red;

  void getDefultValue(){
    int index = orders.indexWhere((o) => o.id == widget.order.id);
    if (index != -1) {
      reelOrder = orders[index];
    } else {
      reelOrder = widget.order; // fallback
    }

    _updateOrderState();
    _updateConfirmationState();
      }

  void _updateOrderState() {
    if (!reelOrder.isFinished) {
      if (reelOrder.isSure) {
        orderStateText = "In Preparing";
        clrOrderState = const Color.fromARGB(255, 255, 193, 8);
      } else {
        orderStateText = "Waiting for confirmation";
        clrOrderState = Colors.blueAccent;
      }
    } else {
      orderStateText = "Finished";
      clrOrderState = Colors.green; // يمكنك استخدام Theme إذا تحب
    }
  }

  void _updateConfirmationState() {
    if (reelOrder.isSure) {
      isSureText = "Confirmed";
      clrIsSureText = const Color.fromARGB(255, 32, 237, 39);
    } else {
      isSureText = "Uncertain";
      clrIsSureText = Colors.red;
    }
  }

  void _confirmOrder() {
    setState(() {
      int index = orders.indexWhere((o) => o.id == reelOrder.id);
      if (index != -1) {
        orders[index].isSure = true;
        reelOrder = orders[index];
        order=clsOrder.empty(id:orders.length+1);
        order.person=person;
        _updateOrderState();
        _updateConfirmationState();
      }
    });
  }

  void _deleteOrder(){
    setState(() {
      int index = orders.indexWhere((o) => o.id == reelOrder.id);
   if(index != -1){
    orders.removeAt(index);
    order=clsOrder.empty(id: orders.length +1);
    order.person=person;
    widget.onDeleted?.call();
   }
    });

  }

  void showDialogCustom(){
     showDialog(
      context: context,
       builder: (BuildContext context){
          return AlertDialog(
              title: Text("Confirm deletion",style:Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black,fontWeight: FontWeight.bold)),
              content: Text("Are you sure of delete this order ??",style:Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black)),
              backgroundColor: Colors.white,
              actions: [
                TextButton(onPressed: (){
                  _deleteOrder();
                  Navigator.pop(context);
                  showDialog(context: context, builder: (BuildContext context){
                    return Dialog(
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("Delete order is done ",style:Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black,fontWeight: FontWeight.bold)),
                    ),
                    );
                  });
                  
                }, child: Text("OK",)),
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text("cancle")),
              ],
          );
     });


  }
  @override
  Widget build(BuildContext context) {
    getDefultValue();

    return InkWell(
      child: Container(
        width: double.infinity,
        height: 180,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 4,
              offset: const Offset(2, 2),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "#${reelOrder.id}",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                Text(
                  isSureText,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: clrIsSureText, fontWeight: FontWeight.bold),
                ),
                Text(
                  reelOrder.orderDate.toString().split(' ')[0],
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
      
            const SizedBox(height: 8),
      
            Row(
              children: [
                const SizedBox(width: 8),
                Text(
                  "Order State :",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                if (!reelOrder.isFinished && reelOrder.isSure)
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset("assets/stopwatch.png", fit: BoxFit.contain),
                  ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    orderStateText,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: clrOrderState, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
      
            const Spacer(),
      
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Items: #${reelOrder.items.length}",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 17, 0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    shadowColor: Colors.red,
                    elevation: 5,
                  ),
                  onPressed: reelOrder.isSure ? null : (){showDialogCustom();},
                  child: Text(
                    "delete",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    shadowColor: Colors.grey,
                    elevation: 5,
                  ),
                  onPressed: reelOrder.isSure ? null : _confirmOrder,
                  child: Text(
                    "Confirm",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetails(order: reelOrder,))).then((value)=>setState(() {
          widget.onDeleted!.call();
        }),);
      },
    );
  }
}
