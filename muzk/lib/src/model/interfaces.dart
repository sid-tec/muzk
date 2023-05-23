abstract class IArtist {
  int get id;
  String get name;
}

abstract class IUser {
  int get id;
  Iterable<int> get playlists;
  String get name;
}

abstract class IIdDeezerList {
  Iterable<int> get ids;
}

abstract class IAlbum {
  int get id;
  Iterable<int> get artists;
  int get year;
  String get title;
}

abstract class ITrack {
  int get id;
  Iterable<int> get artists;
  int get album;
  int get duration;
  String get title;
}

abstract class ITrackFile {
  String get uid;
  int get track;
  String get path;
  String get file;
  bool get hifi;
}

abstract class IPlaylist {
  int get id;
  Iterable<int> get tracks;
  String get title;
}
