
import 'package:dicto/services/authService.dart';
import 'package:flutter/material.dart';
import '../screens/home.dart';


class LoginT extends StatelessWidget {
  const LoginT({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     color: Colors.white,
     home:Login(),
   );
  }
}

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthService _authService;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
           child: Center(
             child: FlatButton(onPressed: () {
        _authService.signInWithGoogle();
          
      
  }, child: Text("Google Sign in")),
           ),
       
      ),
    );
  }
}