import 'package:maquetacion_academy_login/core/request.dart';
import 'package:maquetacion_academy_login/data/model/auth_token.dart';
import 'package:maquetacion_academy_login/data/model/user.dart';

abstract class AuthService{

  Future<User> login(String email, String password);
  Future<bool> register(Map<String, Object?> credentials);

} 

class AuthServiceImpl extends AuthService{

  final Request _request = Request();

  ///
  /// http get request to login with credentials
  /// 
  /// @username
  /// @password
  ///
  ///
  @override
  Future<User> login(String username, String password) async{
    var res = await _request.post("auth/login",data: {'username':username,'password':password});
    if(res.statusCode == 200){
      return User.fromApi(res.data);
    }else{
      throw Exception("Error en authService login. StatusCode: ${res.statusCode} Data: ${res.data}");
    }
  }

  @override
  Future<bool> register(Map<String, Object?> credentials)async{

    var res = await _request.post("users/add",data: credentials);
    if(res.statusCode == 200){
      return true;
    }else{
      throw Exception("Error en authService register. StatusCode: ${res.statusCode} Data: ${res.data}");
    }
  }

} 