import 'package:flutter/material.dart';
import 'package:white_music/components/app_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("W H I T E  M U S I C"),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
    );
  }
}