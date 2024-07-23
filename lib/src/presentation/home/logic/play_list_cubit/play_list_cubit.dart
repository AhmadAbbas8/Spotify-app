import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/src/domain/use_cases/songs/get_play_list_use_case.dart';

import '../../../../../core/service_locator.dart';
import '../../../../domain/entities/songs/songs_entity.dart';

part 'play_list_state.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListLoading());

  Future<void> getPlayList() async {
    emit(PlayListLoading());
    var res = await sl<GetPlayListUseCase>().call(params: null);
    res.fold(
      (l) => emit(PlayListError()),
      (r) => emit(PlayListSuccess(songs: r)),
    );
  }
}
