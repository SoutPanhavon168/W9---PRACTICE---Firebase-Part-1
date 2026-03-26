import 'package:flutter/material.dart';
import '../../../../data/repositories/artist/artist_repository.dart';
import '../../../../model/artists/artist.dart';
import '../../../utils/async_value.dart';

class ArtistViewModel extends ChangeNotifier {
  ArtistRepository artistRepository;
  AsyncValue<List<Artist>> artistsValue = AsyncValue.loading();

  ArtistViewModel({required this.artistRepository}) {
    _init();
  }

  void _init() async {
    artistsValue = AsyncValue.loading();
    notifyListeners();
    try {
      List<Artist> artists = await artistRepository.fetchArtist();
      artistsValue = AsyncValue.success(artists);
      notifyListeners();
    } catch (error) {
      artistsValue = AsyncValue.error(error);
    }
    notifyListeners();
  }
}
