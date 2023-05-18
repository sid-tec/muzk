import 'package:muzk/muzk.dart';
import 'package:muzk/src/model/value_tree_classes.dart';

void main() async {
/*   final artists = await Repo.load(what: What.artist) as Iterable<Artist>;

  for (var artist in artists) {
    print(artist.name);
  } */

  final albums = await Repo.load(what: What.album) as Iterable<Album>;
  //print(albums);
  for (var album in albums) {
    print(album.title);
    for (var artist in album.artists) {
      print(artist.value);
    }
  }

/*   final albumList = await Repo.load(what: What.album);
  //print(albumMap);
  final albums = Album.createMany(albumList: albumList);
  print(albums); */
}

/* List<Artist> createArtist(Iterable<dynamic> maps) {
  final r = <Artist>[];

  for (var map in maps) {
    r.add(Artist.create(id: map['id_deezer'], name: map['name']));
  }

  return r;
} */
