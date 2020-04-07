// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dicto/modal/User.dart';
import 'package:dicto/modal/wordData.dart';
import 'package:dicto/screens/AllWordList.dart';
import 'package:dicto/services/fetchWord.dart';
import 'package:dicto/values/colors.dart';
import 'package:dicto/values/size.dart';
import 'package:dicto/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/WordService.dart';
void main()=>runApp(AllWords());

class AllWords extends StatelessWidget {
  const AllWords({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
@override
     
       void initState() {
    // TODO: implement initState
    super.initState();
    
// dynamic res = WordService(uid: user.uid).words;



  }
      bool loading = false;
    final List<String> list= ["Hell","Kell","url"];
     final wordController = TextEditingController();
 void showSimpleCustomDialog(BuildContext context) {
   final user = Provider.of<User>(context);
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
                        
                         await FetchWord(word: wordController.text,uid:user.uid).fetchWords();
 setState(() {
loading =false;
      });
                        Navigator.pop(context, SimpleDialog);
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
 
     var h =  height(context);
    var w=  width(context);
final user = Provider.of<User>(context);
    return StreamProvider<List<WordData>>.value(
      value: WordService(uid: user.uid).words??[],
          child: loading?Loader():Scaffold(
         appBar:AppBar(
            leading: FlatButton(onPressed: null, child: Image.asset('assets/icon/menu.png')),
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
//           body:ListView.builder(itemCount: list.length,
//                itemBuilder: (BuildContext ctx, int i)
//                {
// return Text(list[i]);
//                }
           

//           ),
body:AllWordList(),
floatingActionButton: FloatingActionButton(onPressed: () {
                  showSimpleCustomDialog(context);
                },
  
  backgroundColor:Colors.white,
  
  child: Icon(Icons.add,color: primary(),),
  
  tooltip: 'Add Vocabulary',
  
  ),
  floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}