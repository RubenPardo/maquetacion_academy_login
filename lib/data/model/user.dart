
///
/// Clase que representa un usuario logeado de la aplicacion
///
/// @name nombre del usuario
/// @password contraseña de la cuenta
/// @email correo usado para crear la cuenta
///
class User{
  
  String name;
  String password;
  String email;
  
  User(this.email,this.password,this.name);

  factory User.fromJsonForm(Map<String, Object?> formValues) {
    return User(
      formValues['email'] as String , 
      formValues['password'] as String , 
      formValues['name'] as String
    );
  }

  factory User.dummy() {
    return User(
      "correo@dummy.es", "1234","User1"
    );
  }


  @override
  String toString() {
    // TODO: implement toString
    return "User [ Email: $email, Password: $password, Name: $name ] ";
  }
  
}