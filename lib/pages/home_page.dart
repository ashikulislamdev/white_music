import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white_music/components/app_drawer.dart';
import 'package:white_music/models/playlist_provider.dart';
import 'package:white_music/models/song.dart';

import 'play_song_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final dynamic playlistProvier;

  @override
  void initState() {
    super.initState();
    playlistProvier = Provider.of<PlaylistProvider>(context, listen: false);
  }

  //go to song
  void playSong(int songIndex){
    playlistProvier.currentSongIndex = songIndex; //update current index

    //navigate to song page
    Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaySongPage()));
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("W H I T E  M U S I C"),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
          //get the playlist
          final List<Song> playList = value.playlist; 

          //listView UI
          return ListView.builder(
            itemCount: playList.length,
            itemBuilder: (context, index){
              //get individual
              final Song singleSong = playList[index];
              return ListTile(
                title: Text(singleSong.songName),
                subtitle: Text(singleSong.artistName),
                leading: Image.asset(singleSong.albumArtImagePath),
                onTap: () {
                  playSong(index);
                },
              );
            }
          );
        }
      ),
    );
  }
}