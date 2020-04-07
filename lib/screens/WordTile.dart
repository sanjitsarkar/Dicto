import 'package:audioplayers/audioplayers.dart';
import 'package:dicto/values/colors.dart';
import 'package:flutter/material.dart';
import '../modal/wordData.dart';

class WordTile extends StatelessWidget {
  final WordData wdata;
  const WordTile({Key key,this.wdata}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    AudioPlayer audioPlayer = AudioPlayer();
    AudioPlayer.logEnabled = true;
    dynamic play() async {
    int result = await audioPlayer.play('https://media.merriam-webster.com/soundc11/${wdata.sound[0]}/${wdata.sound}.wav');
    if (result == 1) {
      // success
      return true;
    }
  }
  return  Container(
      // padding: EdgeInsets.symmetric(horizontal: 10,vertical:10),
      padding: EdgeInsets.only(top:5),
      
      child: Card(
        
        margin: EdgeInsets.only(top: 5.0,left: 5.0,right: 5.0),
  elevation: 6,
color: primary(),

         child:Dismissible(
             background: Container(
              //  margin: EdgeInsets.only(top: 5.0,left: 5.0,right: 5.0),
               color:Colors.white70),
             key:Key('h'),
              onDismissed: (direction) {
    

    Scaffold
        .of(context)
        .showSnackBar(SnackBar(content: Text("Word Archieved")));
  },   
        child: ListTile(
          
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
         
          title: Text(wdata.word,style: TextStyle(color:Colors.white,fontSize: 20,fontFamily: 'Montserrat',fontWeight: FontWeight.w800),),
          subtitle: Text(wdata.shortdef,style: TextStyle(color:Colors.white30.withOpacity(.8),fontSize: 15,fontFamily: 'Montserrat',fontWeight: FontWeight.w100),),
           dense: true,
           isThreeLine: true,
           trailing:IconButton(icon: Icon(Icons.mic,color: Colors.white,), onPressed:()
           async{
             play();
           }),
        ),
),
  )
    );

  }
}