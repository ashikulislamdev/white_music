import 'package:flutter/material.dart';
import 'package:white_music/models/song.dart';

class PlaylistProvider extends ChangeNotifier{
  final List<Song> _playlist = [
    //Songs list
    Song(songName: "Forgive Me Allah", artistName: 'Maher jan', albumArtImagePath: 'assets/images/focus_icon.png', audioPath: 'assets/audios/forgive_me.mp3'),
    
    Song(songName: "The Way of The Tears", artistName: 'Muhammad al Muqit', albumArtImagePath: 'assets/images/exam.png', audioPath: 'assets/audios/the_way.mp3'),
    
    Song(songName: "رحمن يا رحمن مشاري", artistName: 'راشد العفاسي', albumArtImagePath: 'assets/images/qr_scan.jpg', audioPath: 'assets/audios/arabic_song.mp3'),

  ];

  // current song playing index
  int? _currentSongIndex;

  //Getter
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;

  //Setter  
  set currentSongIndex(int? newIndex){
    //update current index
    _currentSongIndex = newIndex;

    //update ui
    notifyListeners();
  }

}