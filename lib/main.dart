import 'package:flutter/material.dart';
import 'package:flutterparallaxscrolling/counter_BLOC.dart';
import 'package:flutterparallaxscrolling/counter_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    counterBLOC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc pattern"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "You tab fab on",
              textScaleFactor: 1.5,
            ),
            StreamBuilder(
              stream: counterBLOC.getCount,
              initialData: CounterProvider().counter,
              builder: (context, snapshot) => Text(
                "${snapshot.data} times",
                textScaleFactor: 1.5,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterBLOC.updateMyCount();
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
