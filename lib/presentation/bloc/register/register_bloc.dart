import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maquetacion_academy_login/data/model/user.dart';
import 'package:maquetacion_academy_login/presentation/bloc/register/register_event.dart';
import 'package:maquetacion_academy_login/presentation/bloc/register/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent,RegisterState>{
  
  
  RegisterBloc() : super (NoContent()){
    
    
    
    on<Register>( //----------------------------------
      (event, emit) async{
        emit(Loading());
        // TODO caso de uso login
        await Future.delayed(Duration(seconds: 2));

        emit(NoContent());
        //print(event.user);
        //emit(Registered(event.user));
      },
    );


  }


  



  
}