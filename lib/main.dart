import 'dart:async';

import 'package:flutter/material.dart';
void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.darkThemeEnabled,
      initialData: false,
      builder: (context, snapshot)=> MaterialApp(
        theme: snapshot.data?ThemeData.dark():ThemeData.light(),
       home: HomePage(snapshot.data),
      ),
    );
  }
}

class HomePage extends StatelessWidget {

 final bool darkThemeEnabled;

  HomePage(this.darkThemeEnabled);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("FamousTheme"),
    ),
    body: Center(child: Text("Hello Famous"),
    ),
    drawer: Drawer(
    child: ListView(
    children: [
    ListTile(
    title: Text("Dark Theme"),
    trailing: Switch(
    value: darkThemeEnabled,
    onChanged: bloc.changedTheme,

    ),
    )
    ],
    ),
    ),
    );

  }
}

class Bloc  {
  final _themeController = StreamController<bool>();
  get changedTheme => _themeController.sink.add;
  get darkThemeEnabled => _themeController.stream;
}

final bloc =Bloc();







