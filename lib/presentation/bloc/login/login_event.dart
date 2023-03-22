abstract class LogInEvent{}
class LogIn extends LogInEvent{
  
  /// json con los parametros de login, 'email' y 'password'
  Map<String, Object?> credentials;

  LogIn(this.credentials);
}
