import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter materia',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: MyHomePage(title: 'My flutter app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _count = 0;

  get e => null;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void getCount() {
    setState(() {
      _count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: Image(
                  image: AssetImage("images/avatar.png"),
                  width: 400.0,
                  height: 400.0,
                )),
            Column(children: [
              //Const Text('You have pushed the button this many times:'),
              Text(
                '$_counter',
                //Theme.of(context).textTheme.headlineSmall,
                style: const TextStyle(color: Colors.orange),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    //执行缩放动画
                    return ScaleTransition(child: child, scale: animation);
                  },
                  child: Text(
                    '$_count',
                    //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                    key: ValueKey<int>(_count),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                ElevatedButton(
                  child: const Text(
                    '+1',
                  ),
                  onPressed: () {
                    setState(() {
                      _count += 1;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.accessible, color: Colors.green),
                Icon(Icons.error, color: Colors.green),
                Icon(Icons.fingerprint, color: Colors.green),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
