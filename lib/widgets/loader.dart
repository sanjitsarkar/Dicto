import 'package:dicto/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatelessWidget {
  const Loader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primary(),
      child: Center(
        child: SpinKitChasingDots(
          color:Colors.white,
          size:50.0,
        ),
      ),
    );
  }
}