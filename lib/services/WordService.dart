import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dicto/modal/word.dart';
import 'package:dicto/modal/wordData.dart';

class WordService
{
   
   static final _firestore = Firestore.instance;
  
 
    String uid;
    WordData wordData;
   WordService({this.uid,this.wordData});

  // Firestore.instance.runTransaction((Transaction tx) async {
  // var _result = await _word.add(wordData.toJson());
  // }
CollectionReference _word = _firestore.collection('Words');

  Future addWord()
  {
    _word = _word.document(uid).collection('AllWords');
    print(uid);
    Firestore.instance.runTransaction((Transaction tx) async {
  var _result = await _word.add(wordData.toJson()).whenComplete(()=>print('added'));
  });
  }
   Future deleteWord(id)
  {
    DocumentReference _docWord = _firestore.collection('Words').document(uid);
   _docWord.collection('AllWords').where("id",isEqualTo: id);
  }

// List<WordData> WordDocSnaps(DocumentSnapshot snapshot)
// {
//   return snapshot.data.map((doc)
//   {
// return WordData(
//   id:
// )
//   }).toList();
// }


List<WordData> _wdata = new List();
  Stream<List<WordData>> get words
  {
     Stream<QuerySnapshot> snaps = Firestore.instance.collection('Words').document(uid).collection('AllWords').snapshots();
       


    return snaps.map(
      (docs) => docs.documents.map(
        (doc) => WordData(
            id:doc.data['id']??'',
            word: doc.data['word']??'',
            type:doc.data['type']??'',
def: doc.data['def']??'',
shortdef:doc.data['shortdef']??'' ,
phonetics: doc.data['phonetics']??'',
sound:doc.data['sound']??'' ,
// time:doc.data['time']??'' ,
           
            )
      ).toList()
    );

  }
//   List<WordData> _wordList(QuerySnapshot snapshot)
// {
//   return snapshot.documents.map((doc)
//   {
//     return WordData(
// id:doc.data['id']??'',
// word:doc.data['word']??'',
// type:doc.data['type']??'',
// def: doc.data['def']??'',
// shortdef:doc.data['shortdef']??'' ,
// phonetics: doc.data['phonetics']??'',
// sound:doc.data['sound']??'' ,
// time:doc.data['time']??'' ,

//     );
//   }).toList();
// }
  Stream get word
  {
     return Firestore.instance.collection('Words').document(uid).collection('AllWords').snapshots();
     
  }


}