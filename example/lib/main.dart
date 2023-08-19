import 'package:flutter/material.dart' hide State;
import 'package:flutter_redurx/flutter_redurx.dart';

import 'app_state.dart';
import 'example1.dart';

void main() {
  final store =
      Store<AppState>(AppState(title: 'Flutter-ReduRx Demo Title', count: 0));
  runApp(Provider(store: store, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter-ReduRx Demo',
        theme: ThemeData(primarySwatch: Colors.pink),
        home: const MyHomePage(),
      );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Example1();
}
