import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:white_music/models/song.dart';

class PlaylistProvider extends ChangeNotifier{
  final List<Song> _playlist = [
    //Songs list
    Song(songName: "Forgive Me Allah", artistName: 'Maher jan', albumArtImagePath: 'assets/images/focus_icon.png', audioPath: 'audios/forgive_me.mp3'),
    
    Song(songName: "The Way of The Tears", artistName: 'Muhammad al Muqit', albumArtImagePath: 'assets/images/exam.png', audioPath: 'audios/the_way.mp3'),
    
    Song(songName: "رحمن يا رحمن مشاري", artistName: 'راشد العفاسي', albumArtImagePath: 'assets/images/qr_scan.jpg', audioPath: 'audios/arabic_song.mp3'),

  ];

  //  Audio Players Functionality //

  //audio player
  final AudioPlayer _audioPlayer = AudioPlayer();
  
  //duration 
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  //constractor 
  PlaylistProvider(){
    listenToDuration();
  }

  //initially not playing
  bool _isPlaying = false;

  //play the song 
  void playSong() async {
    final String audioPath = playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop();  //stop current song
    await _audioPlayer.play(AssetSource(audioPath));  //play the new song
    _isPlaying = true;
    notifyListeners();
  }

  //pause current song
  void pauseSong() async{
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  //resume playing
  void resumeSong() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  //resume or pause
  void pauseOrResume() async{
    if (_isPlaying) {
      pauseSong();
    }else{
      resumeSong();
    }
  }

  //seek to specific position in the current song
  void seekToSpecific(Duration newPosition) async{
    _audioPlayer.seek(newPosition);
  }

  //play next song
  void playNext() async{
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        //go to the next song if it's not the last one
        currentSongIndex = _currentSongIndex! + 1;
      }else{
        //if it's the last one, loop back to last song
        currentSongIndex = 0;
      }
    }
  }
  
  //play previous song
  void playPrevious() async{
    //if more than two second has been passed, restart the current song
    if (_currentDuration.inSeconds > 2) {
      seekToSpecific(Duration.zero);
    }
    //if it's within first two second, go to previous song
    else{
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1; 
      }else{
        //if it's the first song, loop back to last song
        currentSongIndex = playlist.length - 1;
      }
    }
  }

  //listen to duration
  void listenToDuration(){
    //listen total duration 
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration; 
      notifyListeners();
    });
    //listen current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });
    //listen the song is compleated
    _audioPlayer.onPlayerComplete.listen((event) {
      playNext();
    });
  }

  //dispose audio player 
  //getter
  //setter


  // current song playing index
  int? _currentSongIndex;

  //Getter

  //playlist getter
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;

  //song's getter
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  //Setter  
  set currentSongIndex(int? newIndex){
    //update current index in playlist
    _currentSongIndex = newIndex;

    if (newIndex != null) {
      playSong();  //play the song at the new index
    }


    //update ui
    notifyListeners();
  }

}