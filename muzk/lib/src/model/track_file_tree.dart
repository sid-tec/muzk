import 'package:sid_d_d/sid_d_d.dart';

//
class TrackFile extends ValueTree {
  //
  // ===========================
  TrackFile._({
    required super.values,
    required super.what,
  });

  //
  // ===========================
  factory TrackFile.create({
    required String uid,
    required int idTrack,
    required String path,
    required String file,
    required bool hifi,
  }) =>
      TrackFile._(
        what: 'trackFile',
        values: [
          UniqueId(
            uid: uid,
          ),
          IdDeezer(
            what: 'id_track',
            value: idTrack,
          ),
          LocalPath(
            what: 'path',
            value: path,
          ),
          LocalFile(
            what: 'file',
            value: file,
          ),
          Boolean(
            value: hifi,
            what: 'hifi',
          ),
        ],
      );

  //
  // ===========================
  static Iterable<TrackFile> createMany({
    required Iterable<dynamic> trackFileList,
  }) {
    final r = <TrackFile>[];
    //print(albumList);
    for (var map in trackFileList) {
      if (map.containsKey('uid') &&
          map.containsKey('id_track') &&
          map.containsKey('path') &&
          map.containsKey('file') &&
          map.containsKey('hifi')) {
        r.add(TrackFile.create(
          uid: map['uid'],
          idTrack: map['id_track'],
          path: map['path'],
          file: map['file'],
          hifi: map['hifi'],
        ));
      }
    }
    return r;
  }

  String get id => value.first.value;
  int get track => value.elementAt(1).value;
  String get path => value.elementAt(2).value;
  String get file => value.elementAt(3).value;
  bool get hifi => value.last.value;
}
