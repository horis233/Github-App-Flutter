import 'package:Github_app_flutter/common/model/User.dart';

class GithubState {
  User userInfo;

  GithubState({this.userInfo});
}

// One simple action: Increment
class UserActions {
  final User userInfo;

  UserActions(this.userInfo);
}

GithubState counterReducer(GithubState state, dynamic action) {
  if (action is UserActions) {
    state.userInfo = action.userInfo;
  }
  return state;
}
