import 'package:flutter/material.dart';
import 'InputPage.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 runApp (RobotApp());
}
class RobotApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.light().copyWith(
          primary: Colors.transparent,
  
        ),

      ),
      home: InputPage(),
    );
  }
}
