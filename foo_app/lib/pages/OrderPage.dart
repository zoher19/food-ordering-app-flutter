import 'package:flutter/material.dart';
import 'package:foo_app/moduls/ListOfOrders.dart';
import 'package:foo_app/moduls/order_moduls.dart';

class OrderDetails extends StatefulWidget {
  final clsOrder order;

   OrderDetails({super.key,required this.order});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
   String orderStateText = "";

  Color clrOrderState = Colors.amber;

  double totalPrice=0;

void _updateOrderState() {
    if (!widget.order.isFinished) {
      if (widget.order.isSure) {
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

Widget itemWidget(BoxConstraints constraints,BuildContext context,String name,String count,String price){
return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                     child: SizedBox(width:constraints.maxWidth*0.40,child: Text(name,style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                   ),

                    

                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                     child: SizedBox(width:constraints.maxWidth*0.20,child: Text("*$count",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                   ),

                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                     child: SizedBox(width:constraints.maxWidth*0.15,child: Text("\$ $price",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                   ),
                  ],
                ),
                Divider(color: Colors.grey,indent: 15,endIndent: 20,thickness: 2,)
              ],
            );
          
}

Widget getAllItem(BoxConstraints constraints, BuildContext context) {
  final Map<int, dynamic> groupedItems = {};

  for (var item in widget.order.items) 
  {
    if (groupedItems.containsKey(item.id))
     {
      groupedItems[item.id]["count"]++;
      groupedItems[item.id]["price"] += item.price;
     } else 
     {
      groupedItems[item.id] = {
        "name": item.name,
        "count": 1,
        "price": item.price,
      };
    }
    totalPrice+=item.price;
  }

  final filteredItems = groupedItems.values.toList();

  return ListView.builder(
    shrinkWrap: true,
    itemCount: filteredItems.length,
    itemBuilder: (context, index) {
      final item = filteredItems[index];
      
      return itemWidget(
        constraints,
        context,
        item["name"],
        item["count"].toString(),
        item["price"].toString(),
      );
    },
  );
}

void _confirmOrder() {
    setState(() {
      int index = orders.indexWhere((o) => o.id == order.id);
      if (index != -1) {
        orders[index].isSure = true;
        order = orders[index];
        order=clsOrder.empty(id:orders.length+1);
        order.person=person;
        _updateOrderState();
      }
    });
  }

void _deleteOrder(){
    setState(() {
      int index = orders.indexWhere((o) => o.id == order.id);
   if(index != -1){
    orders.removeAt(index);
    order=clsOrder.empty(id: orders.length +1);
    order.person=person;
    Navigator.pop(context);
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
    _updateOrderState();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
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

          Padding(
               padding: EdgeInsets.only(top:100),
               child: Center(child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8),boxShadow: [BoxShadow(color: Theme.of(context).colorScheme.secondary,blurRadius: 8)]),
                child: Text("Order",style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),))),
             ),

             SizedBox(height: 20,),

             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Text("#${widget.order.id}",style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),),
                 ),

                 SizedBox(width: 100,),

                 if (!widget.order.isFinished && widget.order.isSure)
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset("assets/stopwatch.png", fit: BoxFit.contain),
                  ),
                 
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                   child: Text(orderStateText,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: clrOrderState,fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,),
                 ),
               ],
             ),
        
          Divider(color: Colors.grey,thickness: 3,indent: 10,endIndent: 10,height: 0,),

    LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return 
        Container(
            padding: EdgeInsets.only(top:8,bottom: 8),
            margin: EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.secondary,
                  blurRadius: 8,
                )
              ]
            ),
            
            child:Column(
              children: [
                getAllItem(constraints, context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Total : ",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,),       
                     Text(totalPrice.toString(),style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,),       
                   ],)
              ],
            ),
          );
      },
    ),
    Spacer(),
     SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.07,
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        shadowColor: Colors.grey,
                        elevation: 5,
                      ),
                      onPressed: widget.order.isSure ? null : _confirmOrder,
                      child: Text(
                        "Confirm",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
       ),
     ),

     SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.07,
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 17, 0),
                        
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        shadowColor: Colors.red,
                        elevation: 5,
                      ),
                      onPressed: widget.order.isSure ? null : showDialogCustom,
                      child: Text(
                        "delete",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
       ),
     ),

          



             
          ],
        ),
      )
    );
  }
}