import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_app/src/data/models/auth/create_user_req.dart';

import '../../models/auth/signin_user_req.dart';

abstract class AuthFirebaseDataSource {
  Future<Either> signIn(SignInUserReq user);

  Future<Either> signUp(CreateUserReq user);
}

class AuthFirebaseDataSourceImpl implements AuthFirebaseDataSource {
  @override
  Future<Either> signIn(SignInUserReq user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      return const Right('Success');
    } on FirebaseAuthException catch (ex) {
      return Left(ex.code);
    }
  }

  @override
  Future<Either> signUp(CreateUserReq user) async {
    try {
await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      await FirebaseFirestore.instance.collection('Users').add({
        'name': user.fullName,
        'email': user.email,
      });
      return const Right('SignUp Was Successfully');
    } on FirebaseAuthException catch (ex) {
      return Left(ex.code);
    } catch (ex) {
      return Left(ex.toString());
    }
  }
}
