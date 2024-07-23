import 'package:flutter/material.dart';
import 'package:spotify_app/core/widgets/custom_appbar.dart';
import 'package:spotify_app/src/domain/entities/songs/songs_entity.dart';

import '../../../../core/utils/app_url.dart';
import '../widgets/song_cover.dart';

class SongsPlayerScreen extends StatelessWidget {
  const SongsPlayerScreen({
    super.key,
    required this.song,
  });

  final SongEntity song;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Now Playing',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        action: IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert_rounded),
        ),
      ),
      body: Column(
        children: [
          SongCover(song: song),
        ],
      ),
    );
  }
}
