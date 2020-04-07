import 'package:dicto/services/authService.dart';
import 'package:dicto/values/colors.dart';
import 'package:dicto/widgets/loader.dart';
import 'package:flutter/material.dart';
// import '../values/size.dart';
class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  AuthService _authService = AuthService();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    var height =  MediaQuery.of(context).size.height;
    var width =  MediaQuery.of(context).size.width;
   return  loading?Loader():Scaffold(
          body: SingleChildScrollView(
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                image:  DecorationImage(
          image: AssetImage('assets/icon/bg.png'),
          fit: BoxFit.cover
      )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                  SizedBox(height:40),
                  Image.asset('assets/icon/logo.png',width: width/3.5,),
                  SizedBox(height:20),
                  Text('your vocabulary expert',style: TextStyle(color:Colors.white,fontFamily: 'Elemental End',fontSize: 15),),
                   SizedBox(height:25),
                  Text("dicto",style: TextStyle(color:Colors.white,fontFamily: 'Elemental End',fontSize: 55)),
                   SizedBox(height:32),
                  Text('SIGN UP TO GET STARTED',style: TextStyle(color:Colors.white,fontFamily: 'Montserrat',fontSize: 17,fontWeight:FontWeight.bold )),
                  SizedBox(height:20),
                  FlatButton(onPressed: () async{
                    setState(() {
                    loading=true;
                    });
     await _authService.signInWithGoogle();
        
        
  },child: Container(

                    width: width/1.15,
                    height: height/12,
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:Colors.white
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('SIGN UP WITH',style: TextStyle(color: primary(),fontSize: 17,fontFamily: 'Montserrat',fontWeight: FontWeight.w800),),
                        SizedBox(width:30),                        
                        Image.asset('assets/icon/google.png',width: width/10,)
                      ],
                    )
                  ),),
                  Divider(),
                   FlatButton(onPressed: ()
                   {
                    dynamic user =  _authService.signInAnon();
                    print(user.uid);
                   },child: Container(

                    width: width/1.15,
                    height: height/12,
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:Colors.white
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('SIGN UP WITH',style: TextStyle(color: primary(),fontSize: 17,fontFamily: 'Montserrat',fontWeight: FontWeight.w800),),
                        SizedBox(width:30),                        
                        Image.asset('assets/icon/facebook.png',width: width/10,)
                      ],
                    )
                  ),),
                  SizedBox(height:40), 
                 Text('Already have an account',style: TextStyle(color: Colors.white,fontSize: 17,fontFamily: 'Montserrat',fontWeight: FontWeight.w800),),
                 SizedBox(height:10), 
                 InkWell(
                   onTap: null,
                   child: Text('SIGN IN',style: TextStyle(color: Colors.white,fontSize: 17,fontFamily: 'Montserrat',fontWeight: FontWeight.w800),))
                ],
              ),
            ),
                    
            ),
          
    );
  }
}