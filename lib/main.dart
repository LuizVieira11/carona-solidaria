import 'package:carona_solidaria/pages/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        title: "Carona Solidária App",
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        routes: <String, Widget Function(BuildContext)>{
          '/': (context) => const Loginpage(),
        },
      ),
    );
  }
}
