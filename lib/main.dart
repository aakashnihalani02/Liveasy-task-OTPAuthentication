import 'package:flutter/material.dart';
import 'screens/language.dart';
import 'screens/number.dart';
import 'screens/profile.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LanguageScreen.id,
      routes: {
        NumberScreen.id: (context) => NumberScreen(),
        LanguageScreen.id: (context) => LanguageScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
/*
        VerificationScreen.id: (context) => VerificationScreen(),
*/
      },
    );
  }
}
