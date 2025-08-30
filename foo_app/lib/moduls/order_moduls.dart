import 'package:foo_app/moduls/ListOfOrders.dart';
import 'package:foo_app/moduls/item_models.dart';
import 'package:foo_app/moduls/person_modul.dart';

class clsOrder {
   int id;
   clsPerson? person;
  List<Item> items;
  DateTime orderDate;
  bool isFinished;
  bool isSure;

  clsOrder({
    required this.id,
    required this.person,
    required this.items,
    required this.orderDate,
    required this.isFinished,
    required this.isSure,
  });

  clsOrder.empty({
    required this.id,
  })  : items = [],
        person=null,
        orderDate = DateTime.now(),
        isFinished = false,
        isSure = false;
}

var person;
var order ;



