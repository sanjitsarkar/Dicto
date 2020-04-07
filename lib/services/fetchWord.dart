
import 'dart:convert';

import 'package:dicto/modal/word.dart';
import 'package:dicto/modal/wordData.dart';
import 'package:dicto/services/getWords.dart';
import 'package:dicto/services/WordService.dart';
import 'package:http/http.dart' as http;


class FetchWord
{
final String word;
final uid;
FetchWord({this.word,this.uid});
Future<String> fetchWords() async {
  var url = 'https://www.dictionaryapi.com/api/v3/references/collegiate/json/'+word+'?key=be17fad8-d385-4c1e-b668-bf85aa08739f';
 Word data;
    final response =
        await http.get(url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
     var wdata = await json.decode(response.body);
          dynamic id,def,shortdef,phonetics,sound,type;
    //  print(wdata);
   
     id = await wdata[0]['meta']['uuid']??'';

    

    

     def = await wdata[0]['def'][0]['sseq'][0][0][1]['dt'][0][1]??'';
    
   
 
     type = await wdata[0]['fl'];
    

      shortdef =await wdata[0]['shortdef'][0];
 
    
    phonetics =await wdata[0]['hwi']['prs'][0]['mw'];


   
    sound =await wdata[0]['hwi']['prs'][0]['sound']['audio'];
   
    

WordData data1 = WordData(
id:id,
word:word,
def:def,
type:type,
shortdef: shortdef,
phonetics:phonetics,
sound: sound,
time: DateTime.now()

);
// return data;
WordService(wordData: data1,uid: uid).addWord();
   
    
    
  print(wdata[0]['meta']['uuid']);

  }
  else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
 
  } 
}
