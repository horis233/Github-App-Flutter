import 'package:Github_app_flutter/common/model/User.dart';
import 'package:Github_app_flutter/common/redux/UserRedux.dart';

class GithubState {
  User userInfo;

  GithubState({this.userInfo});
}

// One simple action: Increment
GithubState appReducer(GithubState state, action) {
  return GithubState(
    userInfo: UserReducer(state.userInfo, action),
  );
}
