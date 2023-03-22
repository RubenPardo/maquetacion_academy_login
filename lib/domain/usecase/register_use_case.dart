
import 'package:maquetacion_academy_login/data/service/auth_service.dart';

class RegisterUseCase{

  final AuthService _authService = AuthServiceImpl();

  ///
  /// Caso de uso register
  /// 
  /// registra un usuario
  /// 
  /// @user el user a registrar 
  /// @password su contraseña
  ///
  Future<bool> call(Map<String, Object?> credentials) async{
    return await _authService.register(credentials);
  }

}