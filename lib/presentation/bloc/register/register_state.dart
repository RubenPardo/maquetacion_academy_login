import 'package:maquetacion_academy_login/data/model/user.dart';

abstract class RegisterState{}

class Loading extends RegisterState{}
class Error extends RegisterState{
  String message;
  Error(this.message);
}
class NoContent extends RegisterState{}
class Registered extends RegisterState{

}