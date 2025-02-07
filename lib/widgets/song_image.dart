import 'package:flutter/material.dart';

class SongImageComponent extends StatelessWidget {
  const SongImageComponent({
    super.key,
    required this.coverUrl,
    this.size = 60.0,
  });

  final String coverUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
          colors: [Color(0xfffbed96), Color(0xffabecd6)],
          stops: [0, 1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: coverUrl.isNotEmpty
          ? ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                coverUrl,
                fit: BoxFit.fitHeight,
                scale: 1.0,
              ),
            )
          : null,
    );
  }
}
