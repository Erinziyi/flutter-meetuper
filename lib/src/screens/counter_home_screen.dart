import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_meetuper/src/widgets/bottom_navigation.dart';

class CounterHomeScreen extends StatefulWidget {
  final String _title;
  CounterHomeScreen({String title}): _title = title;

  @override
  _CounterHomeScreenState createState() => _CounterHomeScreenState();
}

class _CounterHomeScreenState extends State<CounterHomeScreen> {
  final StreamController<int> _streamController = StreamController<int>.broadcast();
  // final StreamTransformer<int, int> _streamTransformer = StreamTransformer.fromHandlers(
  //   handleData: (int data, EventSink<int> sink) {
  //     print('CALLING FROM HANDLE DATA!!!!!!!');
  //     print(data);
  //     sink.add(data ~/ 2);
  //   }
  // );
  int _counter = 0;

  initState() {
    super.initState();
    _streamController.stream
      // .skip(1)
      // .map((data) {
      //   // print(data);
      //   return data * 2;
      // })
      // // .where((data) => data < 15
      // .map((data) => data - 4)
      // .map((data) => data * data)
      // .transform(_streamTransformer)
      .listen((int number) {
        _counter += number;
        print(_counter);
      });
  }

  _increment() {
    // setState(() {
    //   _counter++;
    // });
    _streamController.sink.add(10);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome in ${widget._title}, lets increment numbers!',
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 15.0)
            ),
            Text(
              'Counter: $_counter',
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 30.0)
            ),
            RaisedButton(
              child: Text('Go To Detail'),
              onPressed: () => Navigator.pushNamed(context, '/meetupDetail'),
            )
          ],
        )
      ),
      bottomNavigationBar: BottomNavigation(),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        tooltip: 'Increment',
        child: Icon(Icons.add)
      ),
      appBar: AppBar(title: Text(widget._title)),
    );
  }
}

