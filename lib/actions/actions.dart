import '../models/myBookingItem/myBookingItem.dart';
import '../models/homeItem/homeItem.dart';

class LoadedItemsAction {
  final List<HomeItem> hostelsNearby;
  final List<MyBookingItem> myBookings;

  LoadedItemsAction(this.hostelsNearby, this.myBookings);
}