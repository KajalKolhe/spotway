import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 31, 51, 68),
      child: Center(
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
