import 'package:spotify_app/src/data/sources/auth/auth_firebase_data_source.dart';
import 'package:spotify_app/src/domain/repo/auth_repo/auth_repo.dart';

import '../../models/auth/create_user_req.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthFirebaseDataSource _dataSource;

  AuthRepoImpl({
    required AuthFirebaseDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<void> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(CreateUserReq user) async {
    await _dataSource.signUp(user);
  }
}
