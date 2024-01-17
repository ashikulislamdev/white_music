import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white_music/theme/theme_provider.dart';
import 'pages/home_page.dart';
void main() {
  runApp(ChangeNotifierProvider(
    create: ((context) => ThemeProvider()), 
    child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Music App',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const HomePage(),
    );
  }
}
