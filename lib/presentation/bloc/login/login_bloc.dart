import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maquetacion_academy_login/data/model/user.dart';
import 'package:maquetacion_academy_login/data/service/auth_service.dart';
import 'package:maquetacion_academy_login/domain/usecase/login_use_case.dart';
import 'package:maquetacion_academy_login/presentation/bloc/login/login_event.dart';
import 'package:maquetacion_academy_login/presentation/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LogInEvent,LogInState>{
  
  
  LoginBloc() : super (NoContent()){
    
    final LoginUseCase loginUseCase = LoginUseCase();
    

    ///
    /// evento login
    /// 
    /// llama al caso de uso, si todo va bien devuelve el usuario, sino un error
    /// 
    /// @event.credentials json con username y password
    /// 
    ///
    on<LogIn>( //----------------------------------
      (event, emit) async{
        emit(Loading());
        
        try{

          String email = event.credentials['username'] as String;
          String password = event.credentials['password'] as String;

          User user = await loginUseCase.call(email, password);
          emit(Loged(user)); // ------------------------------------- return user

        }catch(e){
          print("ERROR: $e");
          emit(Error("Error inseperado al iniciar sesion")); // ----- return error
        }
        
        
      },
    );


  }


  



  
}