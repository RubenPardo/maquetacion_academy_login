import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maquetacion_academy_login/data/model/user.dart';
import 'package:maquetacion_academy_login/data/service/auth_service.dart';
import 'package:maquetacion_academy_login/domain/usecase/login_use_case.dart';
import 'package:maquetacion_academy_login/presentation/bloc/login/login_event.dart';
import 'package:maquetacion_academy_login/presentation/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LogInEvent,LogInState>{
  
  
  LoginBloc() : super (NoContent()){
    
    final LoginUseCase loginUseCase = LoginUseCase();
    
    on<LogIn>( //----------------------------------
      (event, emit) async{
        emit(Loading());
        print("LOGIN------ ${event.credentials}");
        
        try{

          String email = event.credentials['email'] as String;
          String password = event.credentials['password'] as String;

          User user = await loginUseCase.call(email, password);
          print("USER------");
          emit(Loged(user)); // ------------------------------------- return user

        }catch(e){
          print("ERROR: $e");
          emit(Error("Error inseperado al iniciar sesion")); 
        }
        
        
      },
    );


  }


  



  
}