part of 'song_player_cubit.dart';

@immutable
sealed class SongPlayerState {}

final class SongPlayerLoading extends SongPlayerState {}

final class SongPlayerLoaded extends SongPlayerState {}

final class SongPlayerError extends SongPlayerState {}
