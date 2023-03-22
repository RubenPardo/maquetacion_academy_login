import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maquetacion_academy_login/data/model/user.dart';
import 'package:maquetacion_academy_login/domain/usecase/register_use_case.dart';
import 'package:maquetacion_academy_login/presentation/bloc/register/register_event.dart';
import 'package:maquetacion_academy_login/presentation/bloc/register/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent,RegisterState>{
  
  
  RegisterBloc() : super (NoContent()){
    
    final RegisterUseCase registerUseCase = RegisterUseCase();
    
    ///
    /// evento register
    /// 
    /// llama al caso de uso register, si todo va bien devuelve el usuario, sino un error
    /// 
    /// @event.credentials json con name, email y password
    /// 
    ///
    on<Register>( //----------------------------------
      (event, emit) async{
        emit(Loading());
        try{


          bool valid = await registerUseCase.call(event.credentials);
          emit(Registered()); // ------------------------------------- return user

        }catch(e){
          print("ERROR: $e");
          emit(Error("Error inseperado al iniciar sesion")); // ----- return error
        }
      },
    );


  }


  



  
}