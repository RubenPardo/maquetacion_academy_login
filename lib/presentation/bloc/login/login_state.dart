import 'package:maquetacion_academy_login/data/model/user.dart';

abstract class LogInState{}

class Loading extends LogInState{}
class Error extends LogInState{
  String message;
  Error(this.message);
}
class NoContent extends LogInState{}
class Loged extends LogInState{
  User user;
  Loged(this.user);
}