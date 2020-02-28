import '../models/myBookingItem/myBookingItem.dart';
import '../models/homeItem/homeItem.dart';

import '../actions/actions.dart';
import '../state/appState.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    hostelsNearby: homeItemReducer(state.hostelsNearby, action),
    myBookings: myBookingItemReducer(state.myBookings, action),
  );
}

List<HomeItem> homeItemReducer(List<HomeItem> state, action) {
  if (action is LoadedItemsAction) {
    return action.hostelsNearby;
  }

  return state;
}

List<MyBookingItem> myBookingItemReducer(List<MyBookingItem> state, action) {
  if (action is LoadedItemsAction) {
    return action.myBookings;
  }

  return state;
}