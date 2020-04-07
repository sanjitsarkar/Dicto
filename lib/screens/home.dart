import 'dart:async';
import 'package:dicto/services/authService.dart';
import 'package:dicto/services/fetchWord.dart';
import 'package:dicto/values/colors.dart';
import 'package:dicto/widgets/loader.dart';
import 'package:flutter/material.dart';

import '../modal/word.dart';
import '../screens/login.dart';
import '../values/size.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '.././main.dart';
import '../services/WordService.dart';
import '../modal/wordData.dart';
import '../values/colors.dart';
import 'allWords.dart';



class HomeApp extends StatefulWidget {

final uid;
  HomeApp({Key key,this.uid}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  Future futureWord;
  
AuthService _authService = AuthService();
  final searchController = TextEditingController();
    final wordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    searchController.dispose();
    wordController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
   
    
  
  }
   WordData _wordData;
  // void searchWord()
  // {
  //   // print(searchController.text);
  //   if(searchController.text!=null)
  //   {


  //   setState(() {
 
  //   });
  //   }

  // }

  bool loading = false;
  void logout()
  {
_authService.signOutGoogle();
 
          
  }

void showSimpleCustomDialog(BuildContext context) {
    Dialog simpleDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        height:height(context)/3,
        width: width(context),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
width:width(context),
padding: EdgeInsets.symmetric(vertical: 15),
alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color:primary(),
              ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Add Word',
                      style: TextStyle(color: Colors.white,fontSize: 26,fontFamily: 'Montserrat',fontWeight: FontWeight.w800),
                    ),
                    FlatButton(onPressed: ()=>
                    {
                       Navigator.pop(context, SimpleDialog)
                    }, child: Text('X',style: TextStyle(color: Colors.white,fontSize: 26,fontFamily: 'Montserrat',fontWeight: FontWeight.w800)))
                  ],
                ),
              
            ),
           
          
             Container(
               margin:EdgeInsets.symmetric(vertical:20.0,horizontal:20.0),
               child: TextField(
            
                controller: wordController,
                
               decoration: new InputDecoration(
                 
      border:InputBorder.none,
      filled: true,
      hintStyle: new TextStyle(color: Colors.grey[800]),
      hintText: "Enter your word",
      fillColor: primary().withOpacity(.3)),
                
            ),
             ),
          
          Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: width(context)/3,
                    height: height(context)/15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200.0)
                    ),
                    child: RaisedButton(
                      
                      color: primary(),
                      onPressed: () async{
                        setState(() {
                          loading =true;
                        });
                        
                         await FetchWord(word: wordController.text,uid:widget.uid).fetchWords();
 setState(() {
loading =false;
      });
                        // Navigator.pop(context, SimpleDialog);
     
                      },
                      child: Text(
                        'ADD',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ),
                  
                ],
              ),
           
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => simpleDialog);
}

  @override
  Widget build(BuildContext context) {
   
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dicto',
      color:primary(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: loading?Loader():Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          elevation: 2,

          child:ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: <Widget>[
           UserAccountsDrawerHeader(accountName: Text('Sanjit Sarkar',), accountEmail: Text('ssanjit856@gmail.com'),currentAccountPicture:Image.asset('assets/icon/profile.png',) ,decoration:BoxDecoration(
                  color:primary(),

                ) ,
                arrowColor: Colors.white,
                onDetailsPressed: null,
             
                ),
             
              ListTile(
                leading: Icon(Icons.dashboard),
                title: Text('Dashboard'),
               onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
               
              },
              ),
               ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Notifications'),
                onTap: null,
    
              ),
               ListTile(
                leading: Icon(Icons.share),
                title: Text('Share'),
                onTap: null,
    
              ),
               ListTile(
                leading: Icon(Icons.star),
                title: Text('Rate our app'),
                onTap: null,
    
              ),
               ListTile(
                leading: Icon(Icons.info),
                title: Text('About us'),
                onTap: null,
    
              ),
        
                             Align(
                  alignment: Alignment.bottomCenter,
                  child: ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Log out'),
                  onTap: ()
            async{
                await _authService.signOutGoogle();
            },
                ),
                ),
              
              

            ],
          )
        ),
        appBar: AppBar(
          leading: FlatButton(onPressed: () => _scaffoldKey.currentState.openDrawer(), child: Image.asset('assets/icon/menu.png')),
          title: Text('Dicto',style: TextStyle(color:primary(),fontSize: 25,fontFamily: 'Montserrat',fontWeight: FontWeight.w800),),
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search,color:primary(),), onPressed: null),
            InkWell(
            child: Container(

            ),
            )
                    ],
        ),
floatingActionButton: FloatingActionButton(onPressed: () {
                showSimpleCustomDialog(context);
              },
  
  backgroundColor: primary(),
  
  child: Icon(Icons.add),
  
  tooltip: 'Add Vocabulary',
  
  ),
  floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: 
        
         ListView(
           shrinkWrap: true,
                    children:<Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                        decoration: BoxDecoration(
                          color: primary(),
                          boxShadow: [
                            BoxShadow(
            color: Colors.black.withOpacity(.3),
            blurRadius: 10.0, // soften the shadow
            //extend the shadow
            offset: Offset(
              0, // Move to right 10  horizontally
              1.0, // Move to bottom 10 Vertically
            ),
          )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          
                          children: <Widget>[
                            Text('WORD OF THE DAY',style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Montserrat',fontWeight: FontWeight.w800),),
                            SizedBox(height:14),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RichText(
              text: TextSpan(

                children: <TextSpan>[
                  TextSpan(text: 'ephermal\n',style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Montserrat',fontWeight: FontWeight.w800),),
                  TextSpan(text: '/ɪˈfemərəl/',style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'Montserrat',fontWeight: FontWeight.w800),)
                ],
              ),
            ),
                                SizedBox(width:30),
                                Image.asset('assets/icon/speaker-white.png',fit: BoxFit.cover,width: width(context)/14,)

                              ],
                            ),
                            
                            SizedBox(height:14),
                            Text('lasting for a very short time.',style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'Montserrat',fontWeight: FontWeight.w800),),
                            
                          ],

                        ),
                      ),
                      Container(
                         margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
            color: Colors.black.withOpacity(.3),
            blurRadius: 10.0, // soften the shadow
            //extend the shadow
            offset: Offset(
              0, // Move to right 10  horizontally
              1.0, // Move to bottom 10 Vertically
            ),
          )
                          ],
                          color: Colors.white,
                          border: Border.all(color: primary(),width:1)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Image.asset('assets/icon/favorite.png',width: width(context)/5,),
                            Text('FAVOURITE',style: TextStyle(color: primary(),fontSize: 25,fontFamily: 'Montserrat',fontWeight: FontWeight.w800),)
                          ],
                        ),
                      ),
                      InkWell(
                        onTap:()
                        {
  Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return AllWords();
              },
            ),
          );
                        },
                                              child: Container(
                           margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: primary(),width:1),
                            boxShadow: [
                              BoxShadow(
            color: Colors.black.withOpacity(.3),
            blurRadius: 10.0, // soften the shadow
            //extend the shadow
            offset: Offset(
              0, // Move to right 10  horizontally
              1.0, // Move to bottom 10 Vertically
            ),
          )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Image.asset('assets/icon/all.png',width: width(context)/5,),
                              Text('ALL WORDS',style: TextStyle(color: primary(),fontSize: 25,fontFamily: 'Montserrat',fontWeight: FontWeight.w800),)
                            ],
                          ),
                        ),
                      ),
                     
  

                    ] 
         ),
        )
        
      
    );
  }
}