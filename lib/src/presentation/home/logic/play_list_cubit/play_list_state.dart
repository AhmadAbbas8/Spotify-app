part of 'play_list_cubit.dart';

@immutable
sealed class PlayListState {}

final class PlayListLoading extends PlayListState {}

final class PlayListError extends PlayListState {}

final class PlayListSuccess extends PlayListState {
  final List<SongEntity> songs;

  PlayListSuccess({required this.songs});
}
