import 'package:flutter/material.dart';
import 'package:music_app/providers/music_provider.dart';
import 'package:music_app/screens/song_page.dart';
import 'package:music_app/utils/theme/custom_theme.dart';
import 'package:music_app/widgets/playing_card.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../widgets/song_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final musicProvider = Provider.of<MusicProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Playlist",
        ),
      ),
      body: musicProvider.songs.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: musicProvider.songs.length,
                    itemBuilder: (context, index) {
                      return SongCardComponent(
                        trackName: musicProvider.songs[index].title,
                        artistName: musicProvider.songs[index].artist,
                        coverUrl: musicProvider.songs[index].coverUrl,
                        onTapPlay: () async {
                          await musicProvider
                              .currentTrack(musicProvider.songs[index]);
                        },
                      );
                    },
                  ),
                ),
                if (musicProvider.currentSong != null)
                  SlidingUpPanel(
                    minHeight: 140,
                    maxHeight: MediaQuery.of(context).size.height - 80,
                    panel: TrackPage(),
                    collapsed: Container(
                      height: 200.0,
                      padding: EdgeInsets.only(bottom: 20.0),
                      color: secondaryBackgrondColor,
                      child: PlayingCard(),
                    ),
                    body: Center(
                      child:
                          Text("This is the Widget behind the sliding panel"),
                    ),
                  ),
              ],
            ),
    );
  }
}
