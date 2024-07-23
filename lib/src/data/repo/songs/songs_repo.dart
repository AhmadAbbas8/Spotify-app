import 'package:dartz/dartz.dart';
import 'package:spotify_app/src/data/sources/songs/songs_firebase_data_source.dart';
import 'package:spotify_app/src/domain/repo/songs/songs_repo.dart';

class SongsRepoImpl implements SongsRepo {
  final SongsFirebaseDataSource _songsFirebaseDataSource;

  SongsRepoImpl({
    required SongsFirebaseDataSource songsFirebaseDataSource,
  }) : _songsFirebaseDataSource = songsFirebaseDataSource;

  @override
  Future<Either> getNewsSongs() async =>
      await _songsFirebaseDataSource.getNewsSongs();

  @override
  Future<Either> getPlayList() async =>
      await _songsFirebaseDataSource.getPlayList();
}
