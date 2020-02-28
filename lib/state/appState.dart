import 'package:flutter/foundation.dart';

import '../setting/strings.dart';
import '../models/myBookingItem/myBookingItem.dart';
import '../models/homeItem/homeItem.dart';

class AppState {
  final List<HomeItem> hostelsNearby;
  final List<MyBookingItem> myBookings;

  AppState({
    @required this.hostelsNearby,
    @required this.myBookings
  });

  AppState.initialState() :
        hostelsNearby = List.unmodifiable(<HomeItem>[
          HomeItem(
              rating: 2,
              imagePath: 'assets/image2.png',
              name: Strings.LisbonSA,
              price: "234",
              recommended: false
          ),
          HomeItem(
            rating: 3.5,
            imagePath: 'assets/image3.png',
            name: Strings.BBHotelBerlin,
            price: "34",
            recommended: true,
          ),
          HomeItem(
            rating: 3,
            imagePath: 'assets/image2.png',
            name: Strings.ParkPlazaWB,
            price: "55",
            recommended: false,
          ),
          HomeItem(
            rating: 3.5,
            imagePath: 'assets/image3.png',
            name: Strings.BBHotelBerlin,
            price: "34",
            recommended: true,
          ),
          HomeItem(
            rating: 3,
            imagePath: 'assets/image2.png',
            name: Strings.ParkPlazaWB,
            price: "55",
            recommended: false,
          )
        ]),
        myBookings = List.unmodifiable(<MyBookingItem>[
          MyBookingItem(
            name: Strings.ParkPlazaWB,
            lastTime: '12.09.19',
            location: Strings.MyBookingLocation,
            lastMessage: 'Do you want to have coffee tonight?',
            imagePath: 'assets/image5.png',
          ),
          MyBookingItem(
            name: Strings.ParkPlazaWB,
            lastTime: '12.09.19',
            location: Strings.MyBookingLocation,
            lastMessage: 'Do you want to have coffee tonight?',
            imagePath: 'assets/image5.png',
          ),
          MyBookingItem(
            name: Strings.ParkPlazaWB,
            lastTime: '12.09.19',
            location: Strings.MyBookingLocation,
            lastMessage: 'Do you want to have coffee tonight?',
            imagePath: 'assets/image5.png',
          ),
          MyBookingItem(
            name: Strings.ParkPlazaWB,
            lastTime: '12.09.19',
            location: Strings.MyBookingLocation,
            lastMessage: 'Do you want to have coffee tonight?',
            imagePath: 'assets/image5.png',
          ),
          MyBookingItem(
            name: Strings.ParkPlazaWB,
            lastTime: '12.09.19',
            location: Strings.MyBookingLocation,
            lastMessage: 'Do you want to have coffee tonight?',
            imagePath: 'assets/image5.png',
          ),
          MyBookingItem(
            name: Strings.ParkPlazaWB,
            lastTime: '12.09.19',
            location: Strings.MyBookingLocation,
            lastMessage: 'Do you want to have coffee tonight?',
            imagePath: 'assets/image5.png',
          )
        ]);

  AppState.fromJson(Map json)
      : hostelsNearby = (json['hostelsNearby'] as List).map((i) => HomeItem.fromJson(i)).toList(),
        myBookings = (json['myBookings'] as List).map((i) => MyBookingItem.fromJson(i)).toList();

  Map toJson() => {'hostelsNearby': hostelsNearby, 'myBookings' : myBookings};
}