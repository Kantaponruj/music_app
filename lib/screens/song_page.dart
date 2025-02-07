import 'package:flutter/material.dart';
import 'package:music_app/providers/music_provider.dart';
import 'package:music_app/utils/theme/custom_text_theme.dart';
import 'package:music_app/utils/theme/custom_theme.dart';
import 'package:music_app/widgets/control_button.dart';
import 'package:music_app/widgets/song_image.dart';
import 'package:provider/provider.dart';

class TrackPage extends StatelessWidget {
  const TrackPage({super.key});

  @override
  Widget build(BuildContext context) {
    final musicProvider = Provider.of<MusicProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SongImageComponent(
                        coverUrl: musicProvider.currentSong?.coverUrl ?? "",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              musicProvider.currentSong?.title ?? "Track Name",
                              style: headingText(),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Text(
                                musicProvider.currentSong?.artist ?? "Artist",
                                style:
                                    bodyText().copyWith(color: secondaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                StreamBuilder<Duration>(
                  stream: musicProvider.positionStream,
                  builder: (context, snapshot) {
                    final position = snapshot.data ?? Duration.zero;
                    final duration = musicProvider.duration;

                    String formatTime(int seconds) {
                      final hours = seconds ~/ 3600;
                      final minutes = (seconds % 3600) ~/ 60;
                      final secs = seconds % 60;
                      final timeString = hours > 0
                          ? "${hours < 10 ? "0$hours" : hours}:${minutes < 10 ? "0$minutes" : minutes}:${secs < 10 ? "0$secs" : secs}"
                          : "${minutes < 10 ? "0$minutes" : minutes}:${secs < 10 ? "0$secs" : secs}";
                      return timeString;
                    }

                    return Column(
                      children: [
                        Slider(
                          activeColor: primaryColor,
                          inactiveColor: secondaryColor,
                          value: position.inSeconds.toDouble(),
                          max: duration.inSeconds.toDouble(),
                          onChanged: (value) {
                            musicProvider
                                .seekTo(Duration(seconds: value.toInt()));
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                formatTime(position.inSeconds),
                                style: bodyText(),
                              ),
                              Text(
                                formatTime(duration.inSeconds),
                                style: bodyText(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ControlButtons(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
