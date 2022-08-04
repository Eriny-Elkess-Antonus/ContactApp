import 'package:contacts/Screen/editContact.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'HomeScreen/Screen/homepage.dart';

import 'HomeScreen/model/contactProvider.dart';
import 'app/theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.purple));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ContactData(),
        ),
      ],
      child: MaterialApp(
          title: 'Contacts',
          theme: AppTheme().data,
          home: const MyHomePage(),
          debugShowCheckedModeBanner: false,
          routes: {
            EditContact.routeName: (ctx) => const EditContact(),
          }),
    );
  }
}
