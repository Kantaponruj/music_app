class Track {
  final String id;
  final String title;
  final String artist;
  final String album;
  final String duration;
  final String coverUrl;
  final String streamUrl;

  Track({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.duration,
    required this.coverUrl,
    required this.streamUrl,
  });

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      id: json['id'],
      title: json['title'],
      artist: json['artist'],
      album: json['album'],
      duration: json['duration'],
      coverUrl: json['cover_url'],
      streamUrl: json['stream_url'],
    );
  }
}
