import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sesi12/color_bloc2.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(heroTag: 1,
            backgroundColor: Colors.amber,
            onPressed: () {
              bloc.add(ColorEvent.to_amber);
            },
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(heroTag: 2,
            backgroundColor: Colors.lightBlue,
            onPressed: () {
              bloc.add(ColorEvent.to_light_blue);
            },
          )
        ],
      ),
      appBar: AppBar(
        title: Text("BloC Dengan Flutter_bloc"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Center(
            child: BlocBuilder<ColorBloc, Color>(
              builder: (context, currentColor) => AnimatedContainer(
                  width: 100,
                  height: 100,
                  color: currentColor,
                  duration: Duration(milliseconds: 500)),
            ),
          ),
          RaisedButton(
            child: Text("BACK"),
            onPressed: () {
            Navigator.pop(context);
          })
        ],
      ),
    );
  }
}
