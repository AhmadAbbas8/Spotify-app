import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_app/src/data/models/auth/create_user_req.dart';

abstract class AuthFirebaseDataSource {
  Future<void> signIn();

  Future<void> signUp(CreateUserReq user);
}

class AuthFirebaseDataSourceImpl implements AuthFirebaseDataSource {
  @override
  Future<void> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(CreateUserReq user) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
    } on FirebaseAuthException catch (ex) {}
  }
}
