import 'package:cloud_firestore/cloud_firestore.dart';
class WordData
{
  final String id;
  final String word;
  final String def;
  final String type;
  final String shortdef;
  final String phonetics;
  final String sound;
  final DateTime time;
WordData({this.id,this.word,this.def, this.type, this.shortdef,this.phonetics,this.sound,this.time});
 Map<String, dynamic> toJson() =>
  {
   
    'id':id??'',
    'word':word??'',
    'def':def??'',
    'type':type??'',
    'shortdef':shortdef??'',
    'phonetics':phonetics??'',
    'sound': sound??'',
    'time': time??'',
  };
  
}

  