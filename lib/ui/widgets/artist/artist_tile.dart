import 'package:flutter/material.dart';
import '../../../model/artists/artist.dart';

class ArtistTile extends StatelessWidget {
  final Artist artist;
  const ArtistTile({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(25.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: ListTile(
          title: Text(artist.name),
          subtitle: Text(artist.genre),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(artist.imageUrl.toString()),
            radius: 40,
          ),
        ),
      ),
    );
  }
}
