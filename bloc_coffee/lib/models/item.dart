// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_coffee/config/asset_path.dart';

class Item {
  final String id;
  final String image;
  final String name;
  final int price;
  Item({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
  });
}

List<Item> listItem = [
  Item(id: '1', image: AssetPath.cocoa, name: 'Cinnamon & Cocoa', price: 99),
  Item(id: '2', image: AssetPath.drizzled, name: 'Drizzeled with Caramel', price: 199),
  Item(id: '3', image: AssetPath.burst, name: 'Bursting Blueberry', price: 249),
  Item(id: '4', image: AssetPath.dalgona, name: 'Dalgona Whipped Macha', price: 299),
  Item(id: '5', image: AssetPath.cocoa, name: 'Milk Coffee', price: 49),
  Item(id: '6', image: AssetPath.drizzled, name: 'Milk Foam', price: 199),
];
