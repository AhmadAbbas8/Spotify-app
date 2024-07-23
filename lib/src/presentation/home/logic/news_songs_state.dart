part of 'news_songs_cubit.dart';

@immutable
sealed class NewsSongsState {}

// final class NewsSongsInitial extends NewsSongsState {}

final class NewsSongsLoading extends NewsSongsState {}

final class NewsSongsError extends NewsSongsState {}

final class NewsSongsSuccess extends NewsSongsState {
  final List<SongEntity> songs;

  NewsSongsSuccess({
    required this.songs,
  });
}
