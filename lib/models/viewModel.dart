import '../models/myBookingItem/myBookingItem.dart';
import '../models/homeItem/homeItem.dart';
import '../state/appState.dart';

import 'package:redux/redux.dart';

class ViewModel {
  final List<HomeItem> hostelsNearby;
  final List<MyBookingItem> myBookings;

  ViewModel({
    this.hostelsNearby,
    this.myBookings
  });

  factory ViewModel.create(Store<AppState> store) {

    return ViewModel(
      hostelsNearby: store.state.hostelsNearby,
      myBookings: store.state.myBookings
    );
  }
}