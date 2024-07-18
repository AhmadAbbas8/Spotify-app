import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/use_case.dart';
import 'package:spotify_app/src/data/models/auth/signin_user_req.dart';
import 'package:spotify_app/src/domain/repo/auth_repo/auth_repo.dart';

class SignInUseCase implements UseCase<Either, SignInUserReq> {
  final AuthRepo _repo;

  SignInUseCase({
    required AuthRepo repo,
  }) : _repo = repo;

  @override
  Future<Either> call({required SignInUserReq params}) async =>
      await _repo.signIn(params);
}
