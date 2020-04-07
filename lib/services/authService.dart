  import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../modal/User.dart';

class AuthService
{
final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();


User _getUser(FirebaseUser user)
{
  return user !=null ? User(uid: user.uid):null;
}
Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);
 
  return 'signInWithGoogle succeeded: $user';
}


Future signInAnon()
async{
  try{
  FirebaseAuth _auth = FirebaseAuth.instance;
  AuthResult _authResult = await _auth.signInAnonymously();

  return _authResult;
  }
  catch(e)
  {
    print(e.toString());
    return null;
  }

}


Future signOutGoogle() async{
  await googleSignIn.signOut();
  await _auth.signOut();

  
}   

Stream<User> get user
{
  return _auth.onAuthStateChanged.map((_getUser));
}

}