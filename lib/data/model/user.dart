
import 'package:equatable/equatable.dart';
import 'package:maquetacion_academy_login/data/model/auth_token.dart';

///
/// Clase que representa un usuario logeado de la aplicacion
///
/// @name nombre del usuario
/// @password contraseña de la cuenta
/// @email correo usado para crear la cuenta
///
class User extends Equatable{
  
  int id;
  String username;
  String email;
  String firstName;
  String lastName;
  String gender;
  String image;
  AuthToken token;
  
  User(this.id,this.username,this.email,this.firstName,this.lastName,this.gender,this.image,this.token);

  factory User.fromApi(Map<String, Object?> formValues) {
    return User(
      formValues['id'] as int, 
      formValues['username'] as String , 
      formValues['email'] as String , 
      formValues['firstName'] as String,
      formValues['lastName'] as String,
      formValues['gender'] as String,
      formValues['image'] as String,
      AuthToken.fromRawToken(formValues['token'] as String)
    );
  }

  factory User.dummy(){
    return User(1, "username", "email", "firstName", "lastName", "gender", "", AuthToken.dummy());
  }

  Map<String,dynamic> toJson(){
    return {
      'username': username,
      'email':email,
      'firstName':firstName,
      'lastName':lastName,
    };
  }

  @override
  bool? get stringify => true;
  
  @override
  List<Object?> get props => [id,username,email,firstName,lastName,gender,image,token];
  
}