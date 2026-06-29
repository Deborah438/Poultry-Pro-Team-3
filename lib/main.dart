import 'package:flutter/material.dart';
import 'package:poultry/splashscreen.dart';

void main(){
  runApp(const MainPage());
}

class MainPage extends StatelessWidget{
  const MainPage({super.key});

  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen()
    );
  }
}