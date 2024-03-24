import '../../base/base_event.dart';
import '../../object_data/user_data.dart';

class SignUpSuccessEvent extends BaseEvent {
  final UserData userData;
  SignUpSuccessEvent(this.userData);
}
