import 'package:spotify_app/src/domain/entities/songs/songs_entity.dart';

class SongModel extends SongEntity {
  SongModel({
    required super.title,
    required super.artist,
    required super.duration,
    required super.realeseDate,
  });

  factory SongModel.fromJson(Map<String, dynamic> json) => SongModel(
        title: json['title'],
        artist: json['artist'],
        duration: json['duration'],
        realeseDate: json['realeseDate'],
      );
}
