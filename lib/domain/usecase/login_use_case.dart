import 'package:maquetacion_academy_login/core/storage_keys.dart';
import 'package:maquetacion_academy_login/data/model/user.dart';
import 'package:maquetacion_academy_login/data/service/auth_service.dart';
import 'package:maquetacion_academy_login/data/service/storage_service.dart';

class LoginUseCase{

  AuthService authService = AuthServiceImpl();
  StorageService storageService = StorageService();

  ///
  /// Caso de uso login
  /// 
  /// obtiene el token de acceso segun los credenciales y lo guarda en secure storage
  /// 
  /// @email 
  /// @password 
  ///
  Future<User> call(String email, String password) async{
    User user;
    user = await authService.login(email, password);
    storageService.writeSecureData(StorageKeys.authToken,user.token.rawToken);


    
    return user;

  }

}