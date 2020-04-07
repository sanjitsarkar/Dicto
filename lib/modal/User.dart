class User
{
  final String uid;
  final String imgUrl;
  final String name;
  final String email;
  User({this.uid,this.imgUrl,this.email,this.name});
  factory User.fromDoc(Map<String,dynamic> doc)
  {
    return User(
      uid:doc['uid']??'',
      imgUrl: doc['imgUrl']??'',
      name:doc['name']??'',
      email:doc['email']??'',

    
    );
  }
}