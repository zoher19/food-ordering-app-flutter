

import 'package:flutter/material.dart';
import 'package:foo_app/moduls/Categor_moduls.dart';
import 'package:foo_app/moduls/LIstOfItem.dart';
import 'package:foo_app/moduls/ListOfOrders.dart';
import 'package:foo_app/moduls/order_moduls.dart';
import 'package:foo_app/widgets/CustomContainer.dart';
import 'package:foo_app/widgets/FilterContainer.dart';
import 'package:foo_app/widgets/OrderContainer.dart';
import 'package:foo_app/widgets/basketWidget.dart';


class ShowAllItem extends StatefulWidget {
  final VoidCallback onNavigateToSaved;
  const ShowAllItem({super.key,required this.onNavigateToSaved});

  @override
  State<ShowAllItem> createState() => _ShowAllItemState();
}

class _ShowAllItemState extends State<ShowAllItem> {
  int selectedIndex=0;

  var filteredItem=items;

  void showItemWithFilter(){
    filteredItem=items.where((f) => f.category.id==selectedIndex).toList();
    if(filteredItem.isEmpty)
    {
      filteredItem=items;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                         decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).colorScheme.secondary,
                                blurRadius: 4,
                              )
                            ],
                         ),
                         child: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_rounded,size:32,color: Colors.black,))
                         ),
                    ),
          
                    SizedBox(width: 80,),
          
                    Text("Our meals",style:Theme.of(context).textTheme.headlineSmall!.copyWith(color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.bold)),
          
                    Spacer(),
          
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CustomContainerForFavoriteFood(onNavigateToSaved: (){
                        widget.onNavigateToSaved.call();
                        Navigator.pop(context);
                      },),
                    ),
                  ],
                ),

               SizedBox(
                height: 50,
                 child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection:Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context,index) =>
                        Filtercontainer(
                          category: categories[index],
                          isSelected: selectedIndex==index,
                          onTap: (){setState(() {
                            selectedIndex=index;
                            showItemWithFilter();
                          });},
                          ),
                   
                  ),
               ),
                
                Flexible(
                  child: GridView(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250, 
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.56,  
                    ),
                    children: filteredItem.map((item) {
                      return Ordercontainer(item: item,onFavoriteChanged: (){setState(() {
                        
                      });},onItemsChanged: (){
                        setState(() {
                          
                        });
                      },onbackItemDetails: (){setState(() {
                        
                      });},);
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          if(orders.isNotEmpty && order.items.isNotEmpty)
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(alignment: Alignment.bottomRight,child: BasketOrder()),
        ),
        ],
      ),
    );
  }
}