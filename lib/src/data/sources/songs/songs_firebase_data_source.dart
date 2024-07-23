import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/entities/songs/songs_entity.dart';
import '../../models/songs/song_model.dart';

abstract class SongsFirebaseDataSource {
  Future<Either> getNewsSongs();

  Future<Either> getPlayList();

  Future<Either> addOrRemoveFavoriteSong(String songId);

  Future<bool> isFavoriteSong(String songId);

  Future<Either> getUserFavoriteSongs();
}

class SongsFirebaseDataSourceImpl extends SongsFirebaseDataSource {
  @override
  Future<Either> addOrRemoveFavoriteSong(String songId) {
    // TODO: implement addOrRemoveFavoriteSong
    throw UnimplementedError();
  }

  @override
  Future<Either> getNewsSongs() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('songs')
          .orderBy('realeseDate', descending: true)
          .limit(3)
          .get();
      songs = data.docs.map((e) => SongModel.fromJson(e.data())).toList();
      return Right(songs);
    } catch (ex) {
      return Left(ex.toString());
    }
  }

  @override
  Future<Either> getPlayList() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('songs')
          .orderBy('realeseDate', descending: true)
          .get();
      songs = data.docs.map((e) => SongModel.fromJson(e.data())).toList();
      return Right(songs);
    } catch (ex) {
      return Left(ex.toString());
    }
  }

  @override
  Future<Either> getUserFavoriteSongs() {
    // TODO: implement getUserFavoriteSongs
    throw UnimplementedError();
  }

  @override
  Future<bool> isFavoriteSong(String songId) {
    // TODO: implement isFavoriteSong
    throw UnimplementedError();
  }
}
