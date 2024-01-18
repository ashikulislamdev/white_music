import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white_music/components/morphic_box.dart';
import 'package:white_music/models/playlist_provider.dart';

class PlaySongPage extends StatelessWidget {
  const PlaySongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        //get playlist
        final playList = value.playlist;
        
        //get current song
        final currentSong = playList[value.currentSongIndex ?? 0];

        //return scaffold ui
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                //custom appbar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){Navigator.of(context).pop();}, icon: const Icon(Icons.arrow_back_outlined, size: 28,)),
                    const Text('P L A Y L I S T', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.menu_outlined, size: 28,)),
                  ],
                ),
                const SizedBox(height: 24,),
                //song artwork
                MorphicBox(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8), 
                        child: Image.asset(currentSong.albumArtImagePath)
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(currentSong.songName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                Text(currentSong.artistName),
                              ],
                            ),
                            const Icon(Icons.favorite_border, size: 28,)
                          ],
                        ),
                      ),

                    ],
                  )
                ),
                const SizedBox(height: 25),
                //song duration control
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('0:00'),
                      Icon(Icons.shuffle),
                      Icon(Icons.repeat),
                      Text('0:00'),
                    ],
                  ),
                ),

                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6)
                  ),
                  child: Slider(
                    value: 50,
                    activeColor: Colors.deepPurple.shade500,
                    min: 0,
                    max: 100,
                    onChanged: (value) {
                      
                    },
                  ),
                ),
                const SizedBox(height: 25),
                //playback control
                const Row(

                  children: [
                    //skip previous
                    Expanded(child: MorphicBox(child: Icon(Icons.skip_previous, size: 28,))),
                    SizedBox(width: 16),
                    //play pause 
                    Expanded(flex: 2, child: MorphicBox(child: Icon(Icons.play_arrow, size: 28,))),
                    SizedBox(width: 16),
                    //skip forward
                    Expanded(child: MorphicBox(child: Icon(Icons.skip_next, size: 28,))),
                  ],
                )

                ],
              ),
            ),
          )
        );
      }
    );
  }
}