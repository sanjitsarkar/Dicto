import 'package:cloud_firestore/cloud_firestore.dart';
class Word
{
  final String id;
  final String def;
  final String type;
  final String shortdef;
  final String phonetics;
  final String sound;
  final bool fav;
Word({this.id:'',this.def:'', this.type:'', this.shortdef:'',this.phonetics:'',this.sound:'',this.fav:false});
//   factory Word.fromDoc(DocumentSnapshot doc)
// {
//   return Word(
//     id:doc.documentID,
//     def:doc["def"]??'',
//     type: doc['type']??'',
//     shortdef: doc['shortdef']??'',
//     phonetics: doc['phonetics']??'',
//     sound: doc['sound']??'',
//   );
// }
}

  