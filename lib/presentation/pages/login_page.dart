import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maquetacion_academy_login/presentation/bloc/login/login_bloc.dart';
import 'package:maquetacion_academy_login/presentation/bloc/login/login_event.dart';
import 'package:maquetacion_academy_login/presentation/bloc/login/login_state.dart';
import 'package:maquetacion_academy_login/presentation/styles.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  // formulario de login
  FormGroup buildForm() => fb.group(<String, Object>{
        'email': FormControl<String>(
          validators: [Validators.required, Validators.email],
        ),
        'password': FormControl<String>(validators: [Validators.required, Validators.minLength(8),]),
      });

  // controlar el mostrar la contraseña
  bool _passwordVisible = false;



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<LoginBloc,LogInState>(
        builder: (context, state) {
          return Stack(
            children: [
              _body(size),
               (state is Loading) ? _loading(size) : const SizedBox(width: 0,),
            ],
          );
        }, 
        listener: (context, state) {
          
        },
      ) 
    );
  }

  ///
  /// Funcion que devuelve el body del login 
  /// 
  /// @size Objeto size para controlar el responsive
  ///
  Widget _body(Size size){
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.topLeft,
              radius: 1,
              colors: [
                Color(0xffDDF6F3),
                Colors.white
              ],
            )
          ),
          padding: EdgeInsets.only(top: size.height*0.117,left: 25,right: 25),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                    // titulo
                    _buildHeader(),
                    const SizedBox(height: 37,),
                    // formulario de acceso
                    _buildForm(),
                    

                    // social
                    const SizedBox(height: 38.5,), 

                    _buildSocial(),

                   _buildGoRegister(size),  

                  ],
                )
              ),
            
            
         
      
      );
  }
  

  ///
  /// Devuelve un container con transparencia con un circular progress
  ///
  /// @size para hacer que el expanded ocupe toda la pantalla
  ///
  Widget _loading(Size size){
    return Expanded(
      child: Container(
        color: const Color(0x33000000),
        width: size.width,
        height: size.height,
        child: const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)),
      )
    );
  }

  ///
  /// Header del login, titulo y subtittulo
  ///
  Widget _buildHeader(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Welcome back!",style: Styles.titleHiglighted,),
        Text("Enter your credentials to continue.",style: Styles.subTitle,),
      ],
    );
  }

  /// 
  /// Devuelve una columna con un texto y una fila con los botones sociales
  ///
  Widget _buildSocial(){
    return Column(
      children: [
        const Center(child: Text("Or connect via",style: Styles.text,),),
        const SizedBox(height: 18.5,),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            // google
            Container(
              constraints: const BoxConstraints(maxWidth: 110, maxHeight: 50),
              decoration: BoxDecoration(
                color: const Color(0xffF8F8F8),
                border: Border.all(color: const Color(0xFFDDDDDD), width: 2),
                borderRadius: BorderRadius.circular(10)
              ),
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
              child:  IconButton(iconSize: 25,onPressed: null, icon: Image.asset("assets/images/google_logo.png")),
            ),
            const SizedBox(width: 30,),
            // facebook
            Container(
              constraints: const BoxConstraints(maxWidth: 110, maxHeight: 50),
              decoration: BoxDecoration(
                color: const Color(0xffF8F8F8),
                border: Border.all(color: const Color(0xFFDDDDDD), width: 2),
                borderRadius: BorderRadius.circular(10)
              ),
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
              child:  IconButton(iconSize: 25,onPressed: null, icon: Image.asset("assets/images/facebook_logo.png")),
            ),
            
          
          ],
        ),
      ],
    );
  }

  /// 
  /// Construye el formulario del login
  /// 
  Widget _buildForm(){
    return ReactiveFormBuilder(form: buildForm, 
      builder: (context, formGroup, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----------------------------------- email
            ReactiveTextField<String>(
              formControlName: 'email',
              validationMessages: {
                ValidationMessage.required: (_)=> 'The email must not be empty',
                ValidationMessage.email: (_)=> 'The email value must be a valid email',
              },
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Email Address',
                prefixIcon:  Icon(Icons.mail),
                labelStyle: Styles.textHint,
                prefixIconColor: AppColors.textColor,
                fillColor:  Color(0xffF8F8F8),
                filled: true,
                border:  OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFDDDDDD))),
                
              ),
              
            ),
            const SizedBox(height: 10,),
            // ----------------------------------- password
            ReactiveTextField<String>(
              formControlName: 'password',
              obscureText: !_passwordVisible,
              validationMessages: {
                ValidationMessage.required: (_)=> 'The email must not be empty',
                ValidationMessage.minLength: (_)=> 'The password must be at least 8 characters',
              },
              textInputAction: TextInputAction.go,
              decoration:  InputDecoration(
                labelText: 'Password',
                labelStyle: Styles.textHint,
                prefixIcon: const Icon(Icons.lock),
                fillColor:  const Color(0xffF8F8F8),
                filled: true,
                border:  const OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFDDDDDD))),
                prefixIconColor: AppColors.textColor,
                suffixIconColor: AppColors.primaryColor,
                suffixIcon: IconButton(
                  icon: Icon(!_passwordVisible ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() { _passwordVisible = !_passwordVisible;});
                  },
                )
              ),
            ),
            
            const SizedBox(height: 18.5,),
            const Text("Forgot password?",style: Styles.textHiglighted,),
            const SizedBox(height: 18.5,),
            // boton login
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(17)),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(fontSize: 20),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    AppColors.primaryColor,
                  ),
                  elevation: MaterialStateProperty.all(0),
                ),
                onPressed: (){
                  // ---------------------------------------------------> Login
                  if(formGroup.valid){
                    context.read<LoginBloc>().add(LogIn());
                  }else {
                    formGroup.markAllAsTouched();
                  }
                                      
                },
              child: const Text("Log in")
              ),
            ),
          ],
        );
      },
    );
  }

  /// 
  /// Funcion que construye la parte inferior de la pagina, redirige al registro
  /// 
  /// @size usado para que el overflowbox ocupe el ancho de la pantalla y asi obviar los paddings padre
  /// 
  Widget _buildGoRegister(Size size){
    return Expanded(
      child: OverflowBox(
        maxWidth: size.width,
        child:  Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 58,
            color: const Color(0xffE8F3F2),
              child: Center(
                child: Text.rich(
              
                  TextSpan(
                    text: "Don't have an account? ",
                    style: Styles.text,
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: TextButton(
                          onPressed: (){
                            // -----------------------------------------------> Go to Registrar
            
                          }, 
                          child: Text("Register",style: Styles.textHiglighted.copyWith(decoration: TextDecoration.underline,),),
                        )
                      ),
                  ]
                ),
                
              )
            ),
          ),
        )
      ),
    );
  }

}