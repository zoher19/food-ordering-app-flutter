
import 'package:flutter/material.dart';
import 'package:foo_app/moduls/LIstOfItem.dart';
import 'package:foo_app/moduls/ListOfOrders.dart';
import 'package:foo_app/moduls/item_models.dart';
import 'package:foo_app/moduls/order_moduls.dart';
import 'package:foo_app/pages/AllItemPage.dart';
import 'package:foo_app/widgets/BestOrderContainer.dart';
import 'package:foo_app/widgets/CustomContainer.dart';
import 'package:foo_app/widgets/OrderContainer.dart';
import 'package:foo_app/widgets/basketWidget.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onNavigateToSaved;
  HomePage({super.key, required this.onNavigateToSaved});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget menu(final size) {
    return SizedBox(
      height: size.height * 0.4,
      child: ListView.builder(
        itemCount: items.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => Ordercontainer(
          item: items[index],
          onFavoriteChanged: () {
            setState(() {});
          },
          onItemsChanged: () {
            setState(() {});
          },
          onbackItemDetails: () {
            setState(() {});
          },
        ),
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget theBsetMenu(final size) {
    List<Item> BestItems = List.from(items);
    BestItems.sort((a, b) => b.rating.compareTo(a.rating));

    return ListView.builder(
      itemCount: BestItems.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Bestordercontainer(
        item: BestItems[index],
        onFavoriteChanged: () {
          setState(() {});
        },
        onItemsChanged: () {
          setState(() {});
        },
      ),
      shrinkWrap: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorPrimary = Theme.of(context).colorScheme.primary;

    return Stack(
      children: [
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Food Del",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                color: colorPrimary,
                                fontWeight: FontWeight.bold)),
                    Spacer(),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).colorScheme.secondary,
                                blurRadius: 4,
                              )
                            ]),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications_active_outlined,
                              color: Theme.of(context).colorScheme.secondary,
                              size: 30,
                            ))),
                    SizedBox(
                      width: 10,
                    ),
                    CustomContainerForFavoriteFood(
                      onNavigateToSaved: widget.onNavigateToSaved,
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: size.height * 0.01,
              ),

              // بدل SingleChildScrollView + Column → ListView واحدة
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Menu",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                      color: colorPrimary,
                                      fontWeight: FontWeight.bold)),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8, top: 16),
                            child: InkWell(
                              child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          blurRadius: 4,
                                        ),
                                      ]),
                                  child: Text("view all",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              color: colorPrimary,
                                              fontWeight: FontWeight.bold))),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ShowAllItem(
                                              onNavigateToSaved:
                                                  widget.onNavigateToSaved,
                                            ))).then((result) {
                                  setState(() {});
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),

                    menu(size),

                    SizedBox(height: size.height * 0.01,),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("The Best Food",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  color: colorPrimary,
                                  fontWeight: FontWeight.bold)),
                    ),

                    theBsetMenu(size),
                  ],
                ),
              )
            ],
          ),
        ),

        if (orders.where((o) => o.person?.id == person.id).toList().isNotEmpty)
          if (order.items.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                  alignment: Alignment.bottomRight, child: BasketOrder(onUpdate: (){
                    setState(() {
                      
                    });
                  },)),
            ),
      ],
    );
  }
}
