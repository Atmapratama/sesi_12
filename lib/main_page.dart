import 'package:flutter/material.dart';
import 'package:sesi12/second_page.dart';
import 'color_bloc1.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ColorBloc bloc = ColorBloc();
  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(heroTag: 1,
            backgroundColor: Colors.red,
            onPressed: () {
              bloc.eventSink.add(ColorEvent.to_red);
            },
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(heroTag: 2,
              backgroundColor: Colors.purple,
              onPressed: () {
                bloc.eventSink.add(ColorEvent.to_purple);
              }),
        ],
      ),
      appBar: AppBar(
        title: Text(" Bloc tanpa Library"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            StreamBuilder(
              stream: bloc.stateStream,
              initialData: Colors.red,
              builder: (context, snapshot) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  width: 100,
                  height: 100,
                  color: snapshot.data,
                );
              },
            ),
            RaisedButton(child: Text("GO TO SECOND PAGE"),onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SecondPage();
              }));
            })
          ],
        ),
      ),
    );
  }
}
