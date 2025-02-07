import 'package:flutter/material.dart';
import 'package:music_app/models/song_model.dart';
import 'package:music_app/utils/mock_data.dart';

class MusicService {
  Future<List<Track>> getSongs() async {
    List<Track> data = [];

    try {
      await Future.delayed(Duration(seconds: 2), () {
        data = mockTracks;
      });
    } catch (e) {
      debugPrint("Error fetching songs: $e");
    }

    return data;
  }
}
