import 'package:flutter_tunein_attempt3/components/Tune/songTags.dart';
import 'package:flutter_tunein_attempt3/pages/single/singleAlbum.page.dart';
import 'package:flutter_tunein_attempt3/pages/single/singleArtistPage.dart';
import 'package:flutter_tunein_attempt3/plugins/nano.dart';
import 'package:flutter_tunein_attempt3/services/locator.dart';
import 'package:flutter_tunein_attempt3/services/musicService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final musicService = locator<MusicService>();

class PageRoutes {
  static void goToAlbumSongsList(Tune? song, context,
      {Album? album,
      bool subtract60ForBottomBar = false,
      bool rootRouter = false}) {
    Album targetAlbum = album ?? musicService.getAlbumFromSong(song!);
    if (targetAlbum != null) {
      Navigator.of(context, rootNavigator: rootRouter).push(
        MaterialPageRoute(
          builder: (context) => SingleAlbumPage(
            null,
            album: targetAlbum,
            heightToSubstract: subtract60ForBottomBar ? 60 : 0,
          ),
        ),
      );
    }
  }

  static void goToSingleArtistPage(Tune song, context,
      {Artist? artist,
      bool subtract60ForBottomBar = false,
      bool rootRouter = false}) {
    Artist targetArtist = artist ?? musicService.getArtistTitle(song.artist!);
    if (targetArtist != null) {
      Navigator.of(context, rootNavigator: rootRouter).push(
        MaterialPageRoute(
          builder: (context) => SingleArtistPage(targetArtist,
              heightToSubstract: subtract60ForBottomBar ? 60 : 0),
        ),
      );
    }
  }

  static void goToEditTagsPage(Tune song, context,
      {bool subtract60ForBottomBar = false, bool rootRouter = false}) {
    if (song != null) {
      Navigator.of(context, rootNavigator: rootRouter).push(
        MaterialPageRoute(
          builder: (context) =>
              SongTags(song, heightToSubtract: subtract60ForBottomBar ? 60 : 0),
        ),
      );
    }
  }
}
