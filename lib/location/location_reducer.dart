import 'package:redux/redux.dart';
import 'package:too_good_to_go/location/location.dart';
import 'package:too_good_to_go/location/location_actions.dart';

final locationReducer = combineReducers<Location>([
  TypedReducer<Location, SetLocationAction>(_setLocation),
]);

Location _setLocation(Location state, SetLocationAction action) {
  return action.location;
}
