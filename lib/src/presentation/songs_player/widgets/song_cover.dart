import 'package:flutter/cupertino.dart';

import '../../../../core/utils/app_url.dart';
import '../../../domain/entities/songs/songs_entity.dart';

class SongCover extends StatelessWidget {
  const SongCover({super.key, required this.song});

  final SongEntity song;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  '${AppURLs.coverFirestorage}${song.artist} - ${song.title}.webp?${AppURLs.mediaAlt}'))),
    );
  }
}
