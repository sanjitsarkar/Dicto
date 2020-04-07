import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dicto/modal/word.dart';


   

   Future getData()
   {
     
   final _firestore = Firestore.instance;
   final _word =  _firestore.collection('Words');

   final title = _word.document('name').get();
 return title;
   }
   

  
