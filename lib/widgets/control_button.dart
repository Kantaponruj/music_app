import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/providers/music_provider.dart';
import 'package:provider/provider.dart';

class ControlButtons extends StatelessWidget {
  const ControlButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final musicProvider = Provider.of<MusicProvider>(context);
    AudioPlayer player = musicProvider.audioPlayer;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        // _buildButton(
        //   icon: Icons.skip_previous,
        //   onTap: player.hasPrevious ? player.seekToPrevious : null,
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: StreamBuilder<PlayerState>(
            stream: player.playerStateStream,
            builder: (context, snapshot) {
              final playerState = snapshot.data;
              final processingState = playerState?.processingState;
              final playing = playerState?.playing;
              if (processingState == ProcessingState.loading ||
                  processingState == ProcessingState.buffering) {
                return Container(
                  margin: const EdgeInsets.all(8.0),
                  width: 64.0,
                  height: 64.0,
                  child: const CircularProgressIndicator(),
                );
              } else if (playing != true) {
                return _buildMainButton(
                  icon: Icons.play_arrow,
                  onTap: player.play,
                );
              } else if (processingState != ProcessingState.completed) {
                return _buildMainButton(
                  icon: Icons.pause,
                  onTap: player.pause,
                );
              } else {
                return _buildMainButton(
                  icon: Icons.repeat,
                  onTap: () => player.seek(Duration.zero),
                );
              }
            },
          ),
        ),
        // _buildButton(
        //   icon: Icons.skip_next,
        //   onTap: player.hasNext ? player.seekToNext : null,
        // ),
      ],
    );
  }

  // Widget _buildButton({
  //   required IconData icon,
  //   VoidCallback? onTap,
  // }) {
  //   return IconButton(
  //     icon: Icon(
  //       icon,
  //       color: Colors.white,
  //     ),
  //     iconSize: 30.0,
  //     onPressed: onTap,
  //   );
  // }

  Widget _buildMainButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade300,
      ),
      child: IconButton(
        icon: Icon(icon),
        iconSize: 60.0,
        onPressed: onTap,
      ),
    );
  }
}

class PlayingControlButtons extends StatelessWidget {
  const PlayingControlButtons({
    super.key,
    required this.audioPlayer,
  });

  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        StreamBuilder<PlayerState>(
          stream: audioPlayer.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;
            if (processingState == ProcessingState.loading ||
                processingState == ProcessingState.buffering) {
              return Container(
                margin: const EdgeInsets.all(8.0),
                child: const CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else if (playing != true) {
              return _buildMainButton(
                icon: Icons.play_arrow,
                onTap: audioPlayer.play,
              );
            } else if (processingState != ProcessingState.completed) {
              return _buildMainButton(
                icon: Icons.pause,
                onTap: audioPlayer.pause,
              );
            } else {
              return _buildMainButton(
                icon: Icons.repeat,
                onTap: () => audioPlayer.seek(Duration.zero),
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildMainButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return IconButton(
      icon: Icon(icon, color: Colors.white),
      iconSize: 40.0,
      onPressed: onTap,
    );
  }
}
