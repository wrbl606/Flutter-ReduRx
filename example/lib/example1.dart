import 'package:flutter/material.dart';
import 'package:flutter_redurx/flutter_redurx.dart';

import 'app_state.dart';

class Example1 extends StatelessWidget {
  const Example1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Connect<AppState, String?>(
            convert: (state) => state?.title,
            where: (prev, next) => next != prev,
            builder: (title) {
              debugPrint('Building title: $title');
              return Text(title!);
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('You have pushed the button this many times:'),
              Connect<AppState, String>(
                convert: (state) => (state?.count ?? 0).toString(),
                where: (prev, next) => next != prev,
                builder: (count) {
                  debugPrint('Building counter: $count');
                  return Text(count!,
                      style: Theme.of(context).textTheme.displaySmall);
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Provider.dispatch<AppState>(context, Increment()),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }
}
