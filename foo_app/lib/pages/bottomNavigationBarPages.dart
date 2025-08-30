import 'package:flutter/material.dart';
import 'package:foo_app/moduls/ListOfOrders.dart';
import 'package:foo_app/moduls/order_moduls.dart';
import 'package:foo_app/pages/HomePage.dart';
import 'package:foo_app/pages/OrdersPage.dart';
import 'package:foo_app/pages/ProfilePage.dart';
import 'package:foo_app/pages/SavedItemPage.dart';


class MainPage extends StatefulWidget {
    const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
    int _currentIndex = 0;
    int newIndex=-1;
   List<Widget> _pages=[];
   
    @override
void initState() {
  super.initState();
  _pages.addAll([
    HomePage(onNavigateToSaved: () {
      setState(() {
        _currentIndex = 2; // رقم صفحة Saved
      });
    }),
    OrdersPage(),
    Saveditempage(),
    ProfilePage(person: person,),
  ]);
}
    
   Widget CustomIcon(IconData icn){
    return Icon(icn,size:30);
   }
  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar:BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
            BottomNavigationBarItem(icon:CustomIcon(Icons.home_outlined),activeIcon: CustomIcon(Icons.home),label: "Home",tooltip: 'Go to home Screen'),
            BottomNavigationBarItem(icon: CustomIcon(Icons.receipt_long_outlined),activeIcon: CustomIcon(Icons.receipt_long),label: "My Orders",tooltip: 'Go to your Orders'),
            BottomNavigationBarItem(icon: CustomIcon(Icons.favorite_border),activeIcon: CustomIcon(Icons.favorite),label: "Saved",tooltip: 'Go To your saved item'),
            BottomNavigationBarItem(icon: CustomIcon(Icons.person_outline_rounded),activeIcon: CustomIcon(Icons.person_rounded),label: "Profile",tooltip: 'Go To your profile'),
      ],
      currentIndex: _currentIndex,
      onTap: (index){
        setState(() {
          _currentIndex=index;
        });
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Theme.of(context).colorScheme.secondary,
      unselectedItemColor: Theme.of(context).colorScheme.secondary,
      selectedLabelStyle:Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
      unselectedLabelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),


      ),

    );
  }
}