
import 'package:flutter/material.dart';
import 'package:foo_app/moduls/ListOfOrders.dart';
import 'package:foo_app/moduls/favoriteItem_moduls.dart';
import 'package:foo_app/moduls/item_models.dart';
import 'package:foo_app/moduls/order_moduls.dart';
import 'package:foo_app/pages/ItemDetailsPage.dart';
import 'package:foo_app/widgets/FavoriteWidget.dart';
import 'package:foo_app/widgets/starsContainer.dart';

class Ordercontainer extends StatefulWidget {
  final Item item;
  final Color bkgColor;
  final VoidCallback? onFavoriteChanged;
  final VoidCallback? onItemsChanged;
  final VoidCallback? onbackItemDetails;
  

  const Ordercontainer({
    super.key,
    required this.item,
    this.bkgColor = Colors.white,
    this.onFavoriteChanged,
    this.onItemsChanged,
    this.onbackItemDetails
  });

  @override
  State<Ordercontainer> createState() => _OrdercontainerState();
}

class _OrdercontainerState extends State<Ordercontainer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.all(8),
        height: size.height * 0.3,
        width: size.width * 0.5,
        decoration: BoxDecoration(
          color: widget.bkgColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow:  [
            BoxShadow(
              color:Theme.of(context).colorScheme.secondary,
              blurRadius: 4,
            ),
          ],
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image.asset(
                        widget.item.imagePath,
                        height: constraints.maxHeight * 0.5,
                        width: constraints.maxWidth,
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: starsContainer(rating: widget.item.rating),
                      ),
      
                      Align(alignment: Alignment.topLeft,child: Favoritewidget(fItem:clsFavoriteItem(item: widget.item, person: person),onFavoriteChanged: widget.onFavoriteChanged,),)
                    ],
                  ),
                ),
      
                SizedBox(height: constraints.maxHeight * 0.04),
      
               
                Text(
                  widget.item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
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
                  widget.item.description?.isNotEmpty == true
                      ? widget.item.description!
                      : "No description",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                ),
      
                SizedBox(height: constraints.maxHeight * 0.015),
      
                Row(
                  children: [
                    const Icon(Icons.hourglass_bottom_rounded,
                        color: Colors.grey, size: 15),
                    const SizedBox(width: 4),
                    Text(
                      "15 min",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "|",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "${widget.item.colliery} kl",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
                          ),
                    ),
                  ],
                ),
      
                const Spacer(),
      
                Row(
                  children: [
                    Text(
                      "\$${widget.item.price.toStringAsFixed(2)}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        order.items.add(widget.item);
                        debugPrint("Order id : ${order.id.toString()}");
                        if(widget.onItemsChanged!=null)
                          {
                            widget.onItemsChanged?.call();
                          }

                          var newOrders=orders.where((o)=>o.id == order.id);
                          debugPrint(newOrders.isEmpty?"1":"2");
                          if(newOrders.isEmpty)
                          {
                            orders.add(order);
                          }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor:
                            Theme.of(context).colorScheme.primary,
                        elevation: 4,
                      ),
                      child: const Icon(Icons.add, color: Colors.white, size: 27),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => 
        ItemDetailsPage(item: widget.item,),)).then((value)=>widget.onbackItemDetails?.call());
      },
    );
  }
}
