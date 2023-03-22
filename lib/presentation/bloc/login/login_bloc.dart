import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maquetacion_academy_login/data/model/user.dart';
import 'package:maquetacion_academy_login/presentation/bloc/login/login_event.dart';
import 'package:maquetacion_academy_login/presentation/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LogInEvent,LogInState>{
  
  
  LoginBloc() : super (NoContent()){
    
    
    
    on<LogIn>( //----------------------------------
      (event, emit) async{
        emit(Loading());
        // TODO caso de uso login
        await Future.delayed(Duration(seconds: 2));
        
        print(event.credentials);
        emit(Loged(User.dummy()));
      },
    );


  }


  



  
}