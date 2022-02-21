import 'package:application_musicale/screens/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRoutes.getRoutes,
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('Ouvrir écran 2'),
          onPressed: () async {
            // 1ère possibilité
            /*Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => const Screen2(arg: 123),
              ),
            );*/

            // 2ème possibilité
            dynamic res = await Navigator.of(context).pushNamed(
              AppRoutes.routeScreen2,
              arguments: 123,
            );

            if (res is int) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Valeur de retour : $res"),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  final int arg;

  const Screen2({
    required this.arg,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Valeur de l\'argument : $arg'),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(321);
              },
              child: Text("Fermer écran"),
            )
          ],
        ),
      ),
    );
  }
}
