import 'package:bljr_mvvm/core/viewmodel/base_viewmodel.dart';
import 'package:bljr_mvvm/locator.dart';
import 'package:bljr_mvvm/ui/views/news_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>BaseViewModel(),
        )
      ],
      child: MaterialApp(
        title: 'Belajar mvvm',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            body1: TextStyle(fontSize:12)
          )
        ),
        home: NewsView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
