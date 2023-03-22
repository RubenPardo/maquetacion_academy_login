import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maquetacion_academy_login/presentation/bloc/login/login_bloc.dart';
import 'package:maquetacion_academy_login/presentation/bloc/register/register_bloc.dart';
import 'package:maquetacion_academy_login/presentation/pages/login_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()), 
        BlocProvider(create: (context) => RegisterBloc()), 
      ],
      child: const MaterialApp(
        title: 'Login App',
        debugShowCheckedModeBanner: false,
        home: LoginPage()
      )
    );
  }
}