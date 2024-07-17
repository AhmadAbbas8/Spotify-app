import 'package:get_it/get_it.dart';
import 'package:spotify_app/src/data/repo/auth/auth_repo_impl.dart';
import 'package:spotify_app/src/data/sources/auth/auth_firebase_data_source.dart';
import 'package:spotify_app/src/domain/repo/auth_repo/auth_repo.dart';

final sl = GetIt.I;

Future<void> serviceLocatorSetup() async {
  sl.registerLazySingleton<AuthFirebaseDataSource>(
    () => AuthFirebaseDataSourceImpl(),
  );

  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      dataSource: sl(),
    ),
  );
}
