import 'package:maquetacion_academy_login/data/model/user.dart';

abstract class RegisterEvent{}
class Register extends RegisterEvent{
  Map<String, Object?> credentials;
  Register(this.credentials);
}
