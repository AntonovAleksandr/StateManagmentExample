import 'package:redux/redux.dart';
import 'package:untitled2/redux/actions.dart';

final appReducer = combineReducers<int>([
  TypedReducer<int, IncrementAction>(incReducer),
  TypedReducer<int, ResetAction>(resetReducer),
]);

int incReducer(int state, IncrementAction action){
  state = action.count + 1;
  return state;
}

int resetReducer(int state, ResetAction action){
  state = action.count;
  return state;
}