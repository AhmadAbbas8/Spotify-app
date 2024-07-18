import 'package:get_it/get_it.dart';
import 'package:spotify_app/src/data/repo/auth/auth_repo_impl.dart';
import 'package:spotify_app/src/data/sources/auth/auth_firebase_data_source.dart';
import 'package:spotify_app/src/domain/repo/auth_repo/auth_repo.dart';
import 'package:spotify_app/src/domain/use_cases/auth/signin_use_case.dart';
import 'package:spotify_app/src/domain/use_cases/auth/signup_use_case.dart';

final sl = GetIt.I;

Future<void> serviceLocatorSetup() async {
  //**// Data-sources
  sl.registerLazySingleton<AuthFirebaseDataSource>(
    () => AuthFirebaseDataSourceImpl(),
  );

  //**// Repo
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      dataSource: sl(),
    ),
  );
  //**// Use Cases
  sl.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(
      repo: sl(),
    ),
  );
  sl.registerLazySingleton<SignInUseCase>(
    () => SignInUseCase(
      repo: sl(),
    ),
  );
}
