import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../dtos/artist_dto.dart';
import '../../repositories/artist/artist_repository.dart';
import '../../../model/artists/artist.dart';

class ArtistRepositoryFirebase implements ArtistRepository {
  final Uri artistUri = Uri.https(
    'w9-practice-ronan-ogor-default-rtdb.firebaseio.com',
    '/artists.json',
  );

  @override
  Future<List<Artist>> fetchArtist() async {
    final http.Response response = await http.get(artistUri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> artistMap =
          json.decode(response.body) as Map<String, dynamic>;

      List<Artist> artists = [];

      for (var entry in artistMap.entries) {
        artists.add(
          ArtistDto.fromJson(entry.value as Map<String, dynamic>, entry.key),
        );
      }

      return artists;
    } else {
      throw Exception('Failed to load artists: ${response.statusCode}');
    }
  }
}
