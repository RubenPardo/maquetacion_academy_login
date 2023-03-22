import 'package:equatable/equatable.dart';

abstract class LogInEvent extends Equatable{}
class LogIn extends LogInEvent{
  
  /// json con los parametros de login, 'username' y 'password'
  Map<String, Object?> credentials;

  LogIn(this.credentials);
  
  @override
  List<Object?> get props => [credentials];
}
