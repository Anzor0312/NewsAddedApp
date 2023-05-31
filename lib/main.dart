
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/provider/add_news_provider.dart';
import 'package:news/provider/info_provider.dart';
import 'package:news/view/home_page.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MultiProvider(providers:[
    ChangeNotifierProvider(create: (context) => InfoProvider(),),
    ChangeNotifierProvider(create: (context)=>AddNewsProvider())
  ],child: MyApp(),));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage() ,
    );
  }
}