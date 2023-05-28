import 'package:chat_app/providers/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:provider/provider.dart';
import './screens/splash_page.dart';

void main() {
  runApp(Splash(
    key: UniqueKey(),
    OnInitializationComplete: () {
      runApp(MyApp());
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
            create: (BuildContext context) {
          return AuthenticationProvider();
        })
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: Center(
            child: Text("what is this thing"),
          ),
        ),
      ),
    );
  }
}
