
import 'package:flutter/material.dart';
import 'package:foo_app/moduls/ListOfOrders.dart';
import 'package:foo_app/moduls/favoriteItem_moduls.dart';
import 'package:foo_app/moduls/item_models.dart';
import 'package:foo_app/moduls/order_moduls.dart';
import 'package:foo_app/pages/ItemDetailsPage.dart';
import 'package:foo_app/widgets/FavoriteWidget.dart';
import 'package:foo_app/widgets/starsContainer.dart';

class Bestordercontainer extends StatefulWidget {
  final Item item;
  final VoidCallback? onFavoriteChanged;
  final VoidCallback? onItemsChanged;

  const Bestordercontainer({super.key, required this.item,this.onFavoriteChanged,this.onItemsChanged});

  @override
  State<Bestordercontainer> createState() => _BestordercontainerState();
}

class _BestordercontainerState extends State<Bestordercontainer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final containerHeight = size.height * 0.16;

    return Stack(
       alignment: Alignment.centerRight,
      children: [
        InkWell(
          child: Container(
                margin: const EdgeInsets.all(8),
                height: containerHeight,
                width: double.infinity,
                decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow:  [
            BoxShadow(
              color: Theme.of(context).colorScheme.secondary,
              blurRadius: 4,
            ),
          ],
                ),
                child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Container(
              width: size.width * 0.3,
              height: containerHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFF2B2B2B),
               
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  widget.item.imagePath,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          
            const SizedBox(width: 12),
          
           
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Text(
                      widget.item.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),

                    Text(
                  widget.item.category.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                ),
          
                   
                    Text(
                      widget.item.description ?? "No description",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                    ),
          
                    const Spacer(),
          
                    
                    Row(
                      children: [
                        Text(
                          "\$${widget.item.price.toString()}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
          
                        Spacer(),
          
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              order.items.add(widget.item);
                              if(widget.onItemsChanged!=null)
                              {
                                widget.onItemsChanged?.call();
                              }

                              var newOrders=orders.where((o)=>(o.id == order.id));
                                 if(newOrders.isEmpty)
                                 {
                                   orders.add(order);
                                 }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: Theme.of(context).colorScheme.primary,
                              elevation: 4,
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.add, color: Colors.white, size: 20),
                                const SizedBox(width: 6),
                                Text(
                                  "Add",
                                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
                ),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ItemDetailsPage(item: widget.item,))).then((value)=>setState(() {
                  widget.onItemsChanged?.call();
                }));
              },
        ),

      Padding(
        padding: const EdgeInsets.only(bottom: 20.0,right: 16),
        child: starsContainer(rating: widget.item.rating),
      ),

      Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(left:10,bottom: 75),
        child: Favoritewidget(fItem:clsFavoriteItem(item: widget.item, person: person),onFavoriteChanged: widget.onFavoriteChanged,),
      ),
      ),
      
    ],
    );
  }
}
