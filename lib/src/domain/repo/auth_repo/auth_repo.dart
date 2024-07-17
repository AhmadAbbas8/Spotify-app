import 'package:spotify_app/src/data/models/auth/create_user_req.dart';

abstract class AuthRepo {
  Future<void> signUp(CreateUserReq user);

  Future<void> signIn();
}
