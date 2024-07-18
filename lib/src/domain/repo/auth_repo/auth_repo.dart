import 'package:dartz/dartz.dart';
import 'package:spotify_app/src/data/models/auth/create_user_req.dart';
import 'package:spotify_app/src/data/models/auth/signin_user_req.dart';

abstract class AuthRepo {
  Future<Either> signUp(CreateUserReq user);

  Future<Either> signIn(SignInUserReq user);
}
