import 'dart:async';
import 'package:flutter/material.dart';

enum ColorEvent { to_red, to_purple }

class ColorBloc {
  Color _color = Colors.red;

  StreamController<ColorEvent> _eventController =
      StreamController<ColorEvent>();
  StreamSink<ColorEvent> get eventSink => _eventController.sink;

  StreamController<Color> _stateController = StreamController<Color>();
  StreamSink<Color> get _stateSink => _stateController.sink;
  Stream<Color> get stateStream => _stateController.stream;

  void _mapEventToState(ColorEvent colorEvent) {
    if (colorEvent == ColorEvent.to_red)
      _color = Colors.red;
    else
      _color = Colors.purple;

    _stateSink.add(_color);
  }

  ColorBloc() {
    _eventController.stream.listen(_mapEventToState);
  }
  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
