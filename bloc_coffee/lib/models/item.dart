// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:bloc_coffee/config/asset_path.dart';

enum CoffeType { FlatWhite, Espresso, Americano, Latte, Cappuccino }
enum ActionSlidable {delete, favorite, share}
class Item extends Equatable {
  final String id;
  final String image;
  final String name;
  final int price;
  bool? isFavorite;

  Item({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    this.isFavorite,
  }){
    isFavorite = isFavorite ?? false;
  }

  Item copyWith({
    String? id,
    String? image,
    String? name,
    int? price,
    bool? isFavorite,
  }) {
    return Item(
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'name': name,
      'price': price,
      'isFavorite': isFavorite,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as String,
      image: map['image'] as String,
      name: map['name'] as String,
      price: map['price'] as int,
      isFavorite: map['isFavorite'],
    );
  }
  
  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      id,
      image,
      name,
      price,
      isFavorite,
    ];
  }


}

List<Item> listItem = [
  Item(id: '1', image: AssetPath.cocoa, name: 'Cinnamon & Cocoa', price: 99),
  Item(
      id: '2',
      image: AssetPath.drizzled,
      name: 'Drizzeled with Caramel',
      price: 199),
  Item(id: '3', image: AssetPath.burst, name: 'Bursting Blueberry', price: 249),
  Item(id: '4', image: AssetPath.burst, name: 'Bursting Blueberry', price: 249),
  Item(id: '5', image: AssetPath.cocoa, name: 'Milk Coffee', price: 49),
  Item(id: '6', image: AssetPath.drizzled, name: 'Milk Foam', price: 199),
];


List<Map<String, dynamic>> choiceMilk = [
  {
    'name': 'Oalk Milk',
    'selected': true,
  },
  {
    'name': 'Soy Milk',
    'selected': false,
  },
  {
    'name': 'Olmond Milk',
    'selected': false,
  }
];