import 'package:redux/redux.dart';
import 'package:weather/src/actions/get_location.dart';
import 'package:weather/src/models/app_state.dart';

Reducer<AppState> reducer =
    combineReducers(<Reducer<AppState>>[TypedReducer<AppState, GetLocationSuccessful>(_getLocationSuccessful)]);

AppState _getLocationSuccessful(AppState state, GetLocationSuccessful action) {
  return state.rebuild((b) {
    b.location = action.location.toBuilder();
  });
}
