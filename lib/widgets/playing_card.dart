import 'package:flutter/material.dart';
import 'package:music_app/providers/music_provider.dart';
import 'package:music_app/utils/theme/custom_text_theme.dart';
import 'package:music_app/utils/theme/custom_theme.dart';
import 'package:music_app/widgets/control_button.dart';
import 'package:music_app/widgets/song_image.dart';
import 'package:provider/provider.dart';

class PlayingCard extends StatelessWidget {
  const PlayingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final musicProvider = Provider.of<MusicProvider>(context);
    final curentTrack = musicProvider.currentSong;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          height: 5,
          width: 50,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 16),
                height: 60,
                width: 60,
                child: SongImageComponent(coverUrl: curentTrack!.coverUrl),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        curentTrack.title,
                        style: bodyText(isBold: true),
                        textScaler: TextScaler.linear(1.1),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        curentTrack.artist,
                        style: captionText(),
                      ),
                    ],
                  ),
                ),
              ),
              PlayingControlButtons(
                audioPlayer: musicProvider.audioPlayer,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
