
import 'package:dicto/modal/User.dart';
import 'package:dicto/screens/wrapper.dart';
// import 'package:dicto/screens/login.dart';
import 'package:dicto/services/authService.dart';

// import 'package:dicto/services/getWords.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'values/colors.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,

          child: MaterialApp(
        home: Wrapper(),
        debugShowCheckedModeBanner: false,
        color: primary(),

      ),
    );
  }
}
