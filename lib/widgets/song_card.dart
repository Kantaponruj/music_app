import 'package:flutter/material.dart';
import 'package:music_app/utils/theme/custom_text_theme.dart';
import 'package:music_app/utils/theme/custom_theme.dart';
import 'package:music_app/widgets/song_image.dart';

class SongCardComponent extends StatelessWidget {
  const SongCardComponent({
    super.key,
    required this.trackName,
    required this.artistName,
    required this.coverUrl,
    this.onTapPlay,
  });

  final String trackName;
  final String artistName;
  final String coverUrl;
  final void Function()? onTapPlay;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      onTap: onTapPlay,
      leading: SizedBox(
        height: 60,
        width: 60,
        child: SongImageComponent(
          coverUrl: coverUrl,
        ),
      ),
      title: Text(
        trackName,
        textScaler: TextScaler.linear(1.1),
      ),
      titleTextStyle: bodyText(isBold: true),
      subtitle: Text(artistName),
      subtitleTextStyle: captionText().copyWith(color: secondaryColor),
      trailing: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          border: Border.all(
            color: secondaryColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Icon(
          Icons.play_arrow,
          color: Colors.white,
        ),
      ),
    );
  }
}
