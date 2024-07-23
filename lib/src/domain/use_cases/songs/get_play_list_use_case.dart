import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/use_case.dart';
import 'package:spotify_app/src/domain/repo/songs/songs_repo.dart';

class GetPlayListUseCase extends UseCase<Either, dynamic> {
  final SongsRepo _repo;

  GetPlayListUseCase({
    required SongsRepo repo,
  }) : _repo = repo;

  @override
  Future<Either> call({required params}) async => await _repo.getPlayList();
}
