import 'package:flutter/material.dart';
import 'package:spotify_app/core/theme/app_colors.dart';
import 'package:spotify_app/core/widgets/custom_appbar.dart';
import 'package:spotify_app/src/domain/entities/songs/songs_entity.dart';
import 'package:spotify_app/src/presentation/songs_player/widgets/song_details.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SongCover(song: song),
            SongDetails(song: song),
          ],
        ),
      ),
    );
  }
}
