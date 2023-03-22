import 'package:maquetacion_academy_login/core/request.dart';
import 'package:maquetacion_academy_login/data/model/auth_token.dart';
import 'package:maquetacion_academy_login/data/model/user.dart';

abstract class AuthService{

  Future<User> login(String email, String password);
  Future<User> register(String email, String password);

} 

class AuthServiceImpl extends AuthService{

  final Request _request = Request();

  @override
  Future<User> login(String email, String password) async{
    var res = await _request.post("auth/login",data: {'username':email,'password':password});
    if(res.statusCode == 200){
      return User.fromApi(res.data);
    }else{
      throw Exception("Error en authService login. StatusCode: ${res.statusCode} Data: ${res.data}");
    }
  }

  @override
  Future<User> register(String email, String password)async{
    await Future.delayed(Duration(seconds: 1));
    return User.dummy();
  }

} 