import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import '../services/cloud_storage.dart';
import '../services/nevigation_service.dart';
import '../services/database_service.dart';
import '../services/media_service.dart';

import '';

class Splash extends StatefulWidget {
  final VoidCallback OnInitializationComplete;
  Splash({required Key key, required this.OnInitializationComplete})
      : super(key: key);
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    Future.delayed(Duration(seconds: 1)).then((_) {
      _setUp().then((_) => widget.OnInitializationComplete());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Image(image: AssetImage("assets/food_pics/food_pancake.jpg")),
        ),
      ),
    );
  }

  Future<void> _setUp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    _registerServices();
  }

  void _registerServices() {
    GetIt.instance.registerSingleton<NavigationService>(
      NavigationService(),
    );
    GetIt.instance.registerSingleton<MediaService>(
      MediaService(),
    );
    GetIt.instance.registerSingleton<DatabaseService>(
      DatabaseService(),
    );
    GetIt.instance.registerSingleton<CloudStorageService>(
      CloudStorageService(),
    );
  }
}
