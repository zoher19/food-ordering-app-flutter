import 'package:flutter/material.dart';
import 'package:foo_app/moduls/ListOfOrders.dart';
import 'package:foo_app/moduls/order_moduls.dart';
import 'package:foo_app/widgets/CustomOrderWidget.dart';


class OrdersPage extends StatefulWidget {
   OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {

  Widget noOrder(BuildContext context){
    return Center(
      child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageIcon(
              AssetImage("assets/images/food-delivery.png",),
              size: 200,
              color: Theme.of(context).colorScheme.secondary,
            
          ),
          Text("There is no any order",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }

  Widget getAllOrdersAreFinished(BuildContext context)
  {
    var sortedOrders = List.from(orders);
    sortedOrders.sort((a, b) => b.orderDate.compareTo(a.orderDate));
    
    var newSortedOrders=sortedOrders.where((order)=>(order.isFinished && order.person.id == person.id)).toList();
          return  ListView.builder(
              shrinkWrap: true,
              physics:NeverScrollableScrollPhysics(),
              itemCount: newSortedOrders.length,
              itemBuilder:(context,index)=>LastOrderWidget(order: newSortedOrders[index],onDeleted: (){setState(() {   
              });},),
              );
  }

  Widget getAllOrdersAreNotFinished(BuildContext context){
   var newOrders=orders.where((order)=>(!order.isFinished && order.person?.id == person.id)).toList();

    return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: newOrders.length,
              itemBuilder:(context,index)=>LastOrderWidget(order: newOrders[index],onDeleted: (){setState(() {
                
              });},),
              );
  }

  Widget orderPage(BuildContext context){
      int currentOrders=orders.where((element) => (!element.isFinished && element.person?.id == person.id)).toList().length;
      int lastOrdersCount=orders.where((element) => (element.isFinished && element.person?.id == person.id)).toList().length;


    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
         Center(
                  child: Text("Orders",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.bold)
                  ),
                ),
      
      
           Expanded(
             child: SingleChildScrollView(
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                  if(currentOrders != 0)
                   Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text("Current Orders",
                            style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.bold)
                            ),
                    ),
                         
                   getAllOrdersAreNotFinished(context),
                   if(lastOrdersCount != 0 && currentOrders !=0)
                    Divider(
                      height: 30,
                      indent: 20,
                      endIndent: 20,
                      thickness: 5,
                      color: Theme.of(context).colorScheme.secondary,
                      radius: BorderRadius.circular(8),
                    ),
                  if(lastOrdersCount !=0)     
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text("Last Orders",
                            style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.bold)
                            ),
                    ),
                         
                    getAllOrdersAreFinished(context),
                 ],
               ),
             ),
           ),
              ],
            ),

            
       
    
    );
  }

  @override
  Widget build(BuildContext context) {
      var newOrders=orders.where((order)=>order.person?.id == person.id);
    return newOrders.isEmpty ? noOrder(context):orderPage(context);
  }
}