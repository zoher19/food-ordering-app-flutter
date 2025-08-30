

import 'package:foo_app/moduls/LIstOfItem.dart';
import 'package:foo_app/moduls/ListOfPerson.dart';
import 'package:foo_app/moduls/order_moduls.dart';

List<clsOrder>orders=[
clsOrder(
  items: [
    items[0],
    items[0],
    items[1],
    items[2],
],
 person: people[0],
id: 1, 
orderDate: DateTime.now(), 
isFinished: true,
isSure:true
),

clsOrder(
  items: [
    items[0],
    items[3],
    items[1],
    items[2],
],
 person: people[0],
id: 2, 
orderDate: DateTime.now(), 
isFinished: true,
isSure:true
),

clsOrder(
  items: [
    items[3],
    items[4],
    items[1],
    items[2],
],
 person: people[0],
id: 3, 
orderDate: DateTime.now(), 
isFinished: true,
isSure:true
),

clsOrder(
  items: [
    items[3],
    items[4],
    items[1],
    items[2],
    items[4],
    items[3]
],
 person: people[0],
id: 4, 
orderDate: DateTime.now(), 
isFinished: true,
isSure:true
),
];