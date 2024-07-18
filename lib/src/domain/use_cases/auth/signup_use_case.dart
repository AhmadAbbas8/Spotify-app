import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/use_case.dart';
import 'package:spotify_app/src/data/models/auth/create_user_req.dart';
import 'package:spotify_app/src/domain/repo/auth_repo/auth_repo.dart';

class SignUpUseCase implements UseCase<Either, CreateUserReq> {
  final AuthRepo _repo;

  SignUpUseCase({
    required AuthRepo repo,
  }) : _repo = repo;

  @override
  Future<Either> call({required CreateUserReq params}) async {
   return await _repo.signUp(params);
  }
}
