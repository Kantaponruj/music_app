import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/models/song_model.dart';
import 'package:music_app/services/music_service.dart';

class MusicProvider with ChangeNotifier {
  final MusicService _musicService = MusicService();
  final AudioPlayer audioPlayer = AudioPlayer();

  List<Track> _songs = [];
  bool _isLoading = false;
  Track? _currentSong;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  Track? get currentSong => _currentSong;
  List<Track> get songs => _songs;
  bool get isLoading => _isLoading;
  Duration get duration => _duration;
  Duration get position => _position;
  Stream<Duration> get positionStream => audioPlayer.positionStream;

  MusicProvider() {
    fetchMusic();
  }

  Future<void> fetchMusic() async {
    _isLoading = true;
    notifyListeners();

    try {
      _songs = await _musicService.getSongs();
      Track firstSong = _songs.first;
      _currentSong = firstSong;
      await audioPlayer.setAsset(firstSong.streamUrl.toString());
      _duration = audioPlayer.duration ?? Duration.zero;
      debugPrint("Fetched songs: $_songs");
    } catch (e) {
      debugPrint("Error fetching music: $e");
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> currentTrack(Track song) async {
    if (_currentSong != song) {
      debugPrint("Current song: ${song.streamUrl}");
      await audioPlayer.setAsset(song.streamUrl.toString());
      _duration = audioPlayer.duration ?? Duration.zero;

      _currentSong = song;
      audioPlayer.play();
    }

    notifyListeners();
  }

  Future<void> playPauseSong(Track song) async {
    if (_currentSong == song) {
      await audioPlayer.pause();
    } else {
      await audioPlayer.play();

      _listenToProgress();
    }
    notifyListeners();
  }

  void _listenToProgress() {
    audioPlayer.positionStream.listen((pos) {
      _position = pos;
      notifyListeners();
    });
  }

  void seekTo(Duration position) {
    audioPlayer.seek(position);
  }

  void disposeAudio() {
    audioPlayer.dispose();
  }
}
