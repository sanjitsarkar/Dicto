import 'package:dicto/modal/wordData.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'WordTile.dart';
class AllWordList extends StatefulWidget {
  AllWordList({Key key}) : super(key: key);

  @override
  _AllWordListState createState() => _AllWordListState();
}

class _AllWordListState extends State<AllWordList> {

  @override
  Widget build(BuildContext context) {
      final words = Provider.of<List<WordData>>(context)??[];
      
      words.forEach((wrd)
      {
print(wrd.word);
print(wrd.id);
// print(wrd.shortdef);
      });
// for(var i in words.documents)
// {
//   print(i.data['def']);
// }
     
    return Container(
       child: ListView.builder(
         itemCount: words.length,
         itemBuilder: (context,i)
         {
           return WordTile(wdata:words[i]);
         },
       
       ),
    );
  }
}