import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:untitled2/redux/actions.dart';
import 'package:untitled2/redux/reducer.dart';

class MyReduxApp extends StatelessWidget {
  const MyReduxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final ValueNotifier<int> countNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StoreConnector<int, int>(
              builder: (context, countSnapshot) {
                return Text(
                  countSnapshot.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
              converter: (store) => store.state,
            ),
            StoreConnector<int, VoidCallback>(
                builder: (context, action) => ElevatedButton(
                      onPressed: action,
                      child: const Text('Reset me'),
                    ),
                converter: (store) => () {
                      store.dispatch(
                        ResetAction(count: 0),
                      );
                    }),
          ],
        ),
      ),
      floatingActionButton: StoreConnector<int, VoidCallback>(
        builder: (context, action) {
          return FloatingActionButton(
            onPressed: action,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          );
        },
        converter: (store) => () {
          store.dispatch(IncrementAction(
            count: store.state,
          ));
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _incrementCounter() {
    countNotifier.value = countNotifier.value + 1;
    print(countNotifier.value);
  }
}

void main() {
  final store = Store<int>(appReducer, initialState: 0);

  runApp(
    StoreProvider(
      store: store,
      child: const MyReduxApp(),
    ),
  );
}
