import 'dart:math';
import 'package:music_app/models/song_model.dart';

String getRandomCoverUrl() {
  final coverUrls = [
    "assets/images/gradient1.png",
    "assets/images/gradient2.png",
    "assets/images/gradient3.png",
    "assets/images/gradient4.png",
    "assets/images/gradient5.png",
    "assets/images/gradient6.png",
    "assets/images/gradient7.png",
    "assets/images/gradient8.png",
  ];
  return coverUrls[Random().nextInt(coverUrls.length - 1) + 1];
}

List<Track> mockTracks = [
  Track(
    id: '1',
    title: 'Town',
    album: 'Album 1',
    artist: 'BeCorbal',
    duration: "00:03:02",
    coverUrl: getRandomCoverUrl(),
    streamUrl: "assets/music/town-10169.mp3",
  ),
  Track(
    id: '1',
    title: 'Alan Amjad Tiktok Music Audio',
    album: 'Album 2',
    artist: 'alanamjad37',
    duration: "00:00:46",
    coverUrl: getRandomCoverUrl(),
    streamUrl: "assets/music/alan-amjad-tiktok-music-audio-167245.mp3",
  ),
  Track(
    id: '1',
    title: 'Relaxing audio for yoga 🧘‍♂️',
    album: 'Album 3',
    artist: 'u_qhe3hs3v29',
    duration: "00:22:01",
    coverUrl: getRandomCoverUrl(),
    streamUrl: "assets/music/relaxing-audio-for-yoga-131673.mp3",
  ),
  Track(
    id: '1',
    title: 'My music 2',
    album: 'Album 4',
    artist: 'DF_wahyumusicproduction',
    duration: "00:02:27",
    coverUrl: getRandomCoverUrl(),
    streamUrl: "assets/music/my-music-2-242790.mp3",
  ),
  Track(
    id: '1',
    title: 'Energizante Motivation',
    album: 'Album 5',
    artist: 'teodholina',
    duration: "00:02:45",
    coverUrl: getRandomCoverUrl(),
    streamUrl: "assets/music/energizante-motivation-197455.mp3",
  ),
];
