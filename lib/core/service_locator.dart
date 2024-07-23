import 'package:get_it/get_it.dart';
import 'package:spotify_app/src/data/repo/auth/auth_repo_impl.dart';
import 'package:spotify_app/src/data/repo/songs/songs_repo.dart';
import 'package:spotify_app/src/data/sources/auth/auth_firebase_data_source.dart';
import 'package:spotify_app/src/data/sources/songs/songs_firebase_data_source.dart';
import 'package:spotify_app/src/domain/repo/auth_repo/auth_repo.dart';
import 'package:spotify_app/src/domain/repo/songs/songs_repo.dart';
import 'package:spotify_app/src/domain/use_cases/auth/signin_use_case.dart';
import 'package:spotify_app/src/domain/use_cases/auth/signup_use_case.dart';
import 'package:spotify_app/src/domain/use_cases/songs/get_news_songs_use_case.dart';
import 'package:spotify_app/src/domain/use_cases/songs/get_play_list_use_case.dart';

final sl = GetIt.I;

Future<void> serviceLocatorSetup() async {
  //**// Data-sources
  sl.registerLazySingleton<AuthFirebaseDataSource>(
    () => AuthFirebaseDataSourceImpl(),
  );
  sl.registerLazySingleton<SongsFirebaseDataSource>(
    () => SongsFirebaseDataSourceImpl(),
  );

  //**// Repo
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      dataSource: sl(),
    ),
  );
  sl.registerLazySingleton<SongsRepo>(
    () => SongsRepoImpl(
      songsFirebaseDataSource: sl(),
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
  sl.registerLazySingleton<GetNewsSongsUseCase>(
    () => GetNewsSongsUseCase(
      songsRepo: sl(),
    ),
  );
  sl.registerLazySingleton<GetPlayListUseCase>(
    () => GetPlayListUseCase(
      repo: sl(),
    ),
  );
}
