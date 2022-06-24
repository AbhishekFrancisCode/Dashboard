import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final String message;
  //final double height;

  const ProgressIndicatorWidget(
      {Key? key, this.message = "Loading, please wait..."})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 80,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const CircularProgressIndicator(),
          const SizedBox(
            height: 20,
          ),
          Text(message, style: const TextStyle(fontSize: 18))
        ],
      ),
    );
  }
}
