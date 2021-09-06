import 'package:flutter/material.dart';

import 'counter_list_screen/counter_list_route.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (_) => CounterListScreenRoute<void>(),
    );
  }
}
