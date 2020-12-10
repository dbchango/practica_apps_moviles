import 'package:flutter/material.dart';

class CurrentLocationWidget extends StatelessWidget {
  const CurrentLocationWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    print("Altura: $_height");
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: _height*0.33,
            child: Container(
              color: Colors.blue,
            ),  
          )
        ],
      ),
    );
  }
}