import 'package:equatable/equatable.dart';
import 'package:jwt_decode/jwt_decode.dart';
class AuthToken extends Equatable{

  final String rawToken;
  final String refreshToken;
  DateTime expiryDate;

  static const String storageKey = "authTokenkey";

  AuthToken({required this.rawToken,required this.expiryDate, required this.refreshToken});


  factory AuthToken.fromRawToken(String rawToken){
    // TODO deshacer token para obtener expires at entre otros, jwt
    Map<String, dynamic> payload = Jwt.parseJwt(rawToken);
    return AuthToken(
      rawToken: rawToken, 
      expiryDate: Jwt.getExpiryDate(rawToken) ?? DateTime.now(), 
      refreshToken: "refresh_token" // inventado
    );
  }

  factory AuthToken.dummy(){
    return AuthToken(rawToken: "rawToken", expiryDate: DateTime.now(), refreshToken: "refreshToken");
  }


  @override
  String toString() {
    // TODO: implement toString
    return "AuthToken [rawToken: $rawToken, expiryDate: ${expiryDate.millisecondsSinceEpoch}, refresh_token: $refreshToken]";
  }
  
  @override
  bool? get stringify => true;
  
  @override
  List<Object?> get props => [rawToken,expiryDate,refreshToken];
  

}