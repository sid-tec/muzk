import 'package:sid_d_d/sid_d_d.dart';
//
import 'interfaces.dart';
import 'id_deezer_list_tree.dart';

class Album extends ValueTree implements IAlbum {
  //
  // ===========================
  Album._({
    required super.values,
    required super.what,
  });

  //
  // ===========================
  factory Album.create({
    required int id,
    required Iterable<int> artists,
    required int year,
    required String title,
  }) =>
      Album._(
        what: 'album',
        values: [
          IdDeezer(
            what: 'id',
            value: id,
          ),
          IdDeezerList.create(
            what: 'artists',
            ids: artists,
          ),
          Year(
            value: year,
            what: 'year',
          ),
          Title(
            what: 'title',
            value: title,
          ),
        ],
      );

  //
  // ===========================
  static Iterable<Album> createMany({
    required Iterable<dynamic> albumList,
  }) {
    final r = <Album>[];
    //print(albumList);
    for (var map in albumList) {
      if (map.containsKey('id') &&
          map.containsKey('title') &&
          map.containsKey('artists') &&
          map.containsKey('year')) {
        final artists = <int>[];
        for (var i in map['artists']) {
          artists.add(i);
        }
        r.add(Album.create(
          id: map['id'],
          artists: artists, // map['artists'] as Iterable<int>,
          year: map['year'],
          title: map['title'],
        ));
      }
    }
    return r;
  }

  @override
  int get id => value.first.value;
  @override
  Iterable<int> get artists {
    var v = value.elementAt(1) as IdDeezerList;
    return v.ids;
  }

  @override
  int get year => value.elementAt(2).value;
  @override
  String get title => value.last.value;
}
