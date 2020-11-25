import 'package:flutter/material.dart';
import 'package:memory_cards/game_page.dart';

void main() => runApp(MyApp());

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Выберите игру:')),
      body: Center(
          child: Column(
        children: [
          RaisedButton(
              onPressed: () {
                points = 0;
                axes = 6;
                print('onPresed ' + axes.toString());
                Navigator.pushNamed(context, '/6');
              },
              child: Text('6х6')),
          RaisedButton(
              onPressed: () {
                points = 0;
                axes = 2;
                print('onPresed ' + axes.toString());
                Navigator.pushNamed(context, '/2');
              },
              child: Text('2х2')),
          RaisedButton(
              onPressed: () {
                points = 0;
                axes = 4;
                print('onPresed ' + axes.toString());
                Navigator.pushNamed(context, '/4');
              },
              child: Text('4х4')),
        ],
      )),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => MainScreen(),
          '/6': (BuildContext context) => new SecondScreen(),
          '/2': (BuildContext context) => SecondScreen(),
          '/4': (BuildContext context) => SecondScreen(),
        });
  }
}
