import 'dart:async';

import 'package:flutterparallaxscrolling/counter_provider.dart';

class CounterBLOC {
  StreamController counterController = StreamController();
  final CounterProvider provider = CounterProvider();

  Stream get getCount => counterController.stream;

  void updateMyCount() {
    provider.updateCounter();
    counterController.sink.add(provider.counter);
  }

  void dispose() {
    counterController.close();
  }
}

final counterBLOC = CounterBLOC();
