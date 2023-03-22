import 'package:maquetacion_academy_login/core/storage_keys.dart';
import 'package:maquetacion_academy_login/data/model/user.dart';
import 'package:maquetacion_academy_login/data/service/auth_service.dart';
import 'package:maquetacion_academy_login/data/service/storage_service.dart';

class LoginUseCase{

  final AuthService _authService = AuthServiceImpl();
  final StorageService _storageService = StorageService();

  ///
  /// Caso de uso login
  /// 
  /// obtiene el token de acceso segun los credenciales y lo guarda en secure storage
  /// 
  /// @email 
  /// @password 
  ///
  Future<User> call(String username, String password) async{
    User user;
    user = await _authService.login(username, password);
    _storageService.writeSecureData(StorageKeys.authToken,user.token.rawToken);


    
    return user;

  }

}