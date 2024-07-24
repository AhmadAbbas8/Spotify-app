import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/core/theme/app_colors.dart';
import 'package:spotify_app/core/widgets/custom_appbar.dart';
import 'package:spotify_app/src/domain/entities/songs/songs_entity.dart';
import 'package:spotify_app/src/presentation/songs_player/logic/song_player_cubit.dart';
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
        title: const Text(
          'Now Playing',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        action: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert_rounded),
        ),
      ),
      body: BlocProvider(
        create: (_) => SongPlayerCubit()
          ..loadSong('${AppURLs.songFirestorage}02.mp3?${AppURLs.mediaAlt}'),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SongCover(song: song),
              SongDetails(song: song),
              _songPlayer(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _songPlayer(BuildContext context) {
    return BlocBuilder<SongPlayerCubit, SongPlayerState>(
      builder: (context, state) {
        var cubit = context.read<SongPlayerCubit>();
        if (state is SongPlayerLoading) {
          return const CircularProgressIndicator();
        }
        if (state is SongPlayerLoaded) {
          return Column(
            children: [
              Slider(
                value: cubit.songPosition.inSeconds.toDouble(),
                min: 0.0,
                max: cubit.songDuration.inSeconds.toDouble(),
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatDuration(cubit.songPosition),
                  ),
                  Text(
                    formatDuration(cubit.songDuration),
                  )
                ],
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  cubit.playOrPauseSong();
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.primary),
                  child: Icon(
                    cubit.audioPlayer.playing ? Icons.pause : Icons.play_arrow,
                  ),
                ),
              ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
