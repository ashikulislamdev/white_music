import 'package:flutter/material.dart';
import 'package:white_music/pages/settings_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(child: Center(child: Icon(Icons.music_note_outlined, color: Theme.of(context).colorScheme.inversePrimary, size: 40,),)),

          Padding(
            padding: const EdgeInsets.only(top: 25, left: 25),
            child: ListTile(
              title: const Text('H O M E'),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 25),
            child: ListTile(
              title: const Text('S e t t i n g s'),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
              },
            ),
          ),
        ],
      ),
    );
  }
}