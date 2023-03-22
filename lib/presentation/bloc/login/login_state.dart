import 'package:equatable/equatable.dart';
import 'package:maquetacion_academy_login/data/model/user.dart';

abstract class LogInState extends Equatable{}

class Loading extends LogInState{
  @override
  List<Object?> get props => [];
}
class Error extends LogInState{
  final String message;
  Error(this.message);
  @override
  List<Object?> get props => [message];
}
class NoContent extends LogInState{
  @override
  List<Object?> get props => [];
}
class Loged extends LogInState{
  final User user;
  Loged(this.user);
  
  @override
  List<Object?> get props => [user];
}