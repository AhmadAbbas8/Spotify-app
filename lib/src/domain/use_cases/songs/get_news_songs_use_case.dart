import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/use_case.dart';
import 'package:spotify_app/src/domain/repo/songs/songs_repo.dart';

class GetNewsSongsUseCase implements UseCase<Either, dynamic> {
  final SongsRepo _songsRepo;

  GetNewsSongsUseCase({
    required SongsRepo songsRepo,
  }) : _songsRepo = songsRepo;

  @override
  Future<Either> call({required dynamic params}) async =>
      await _songsRepo.getNewsSongs();
}
