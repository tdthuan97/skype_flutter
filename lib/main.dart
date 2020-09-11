import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skypeflutter/pages/search_page.dart';
import 'package:skypeflutter/provider/image_upload_provider.dart';
import 'package:skypeflutter/resources/firebase_repository.dart';

import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'provider/user_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseRepository _repository = FirebaseRepository();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ImageUpLoadProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        )
      ],
      child: MaterialApp(
          title: 'Skype Clone',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(brightness: Brightness.dark),
          initialRoute: "/",
          routes: {
            '/search_page': (context) => SearchPage(),
          },
          home: FutureBuilder(
            future: _repository.getCurrentUser(),
            builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
              if (snapshot.hasData) {
                return HomePage();
              } else {
                return LoginPage();
              }
            },
          )),
    );
  }
}
