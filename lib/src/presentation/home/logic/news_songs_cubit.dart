import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/src/domain/use_cases/songs/get_news_songs_use_case.dart';
import '../../../../core/service_locator.dart';
import '../../../domain/entities/songs/songs_entity.dart';

part 'news_songs_state.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewsSongs() async {
    emit(NewsSongsLoading());
    var res = await sl<GetNewsSongsUseCase>().call(params: null);
    res.fold(
      (l) => emit(NewsSongsError()),
      (r) => emit(NewsSongsSuccess(songs: r)),
    );
  }
}
