import '../../model/artists/artist.dart';

class ArtistDto {
  static const idKey = "id";
  static const genreKey = "genre";
  static const imageUrlKey = "imageUrl";
  static const nameKey = "name";

  static Artist fromJson(Map<String, dynamic> json , String id) {
    return Artist(
      id: json[idKey],
      genre: json[genreKey],
      imageUrl: Uri.parse(json[imageUrlKey]),
      name: json[nameKey],
    );
  }
}
