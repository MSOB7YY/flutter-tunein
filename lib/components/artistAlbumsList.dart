///DEPRECATED WARNING
/// /////////////////////////////////////////////////////////
///THIS HAS BEEN DEPRECATED AND MAY BE REMOVED IN THE FUTURE
/// /////////////////////////////////////////////////////////

import 'package:flutter_tunein_attempt3/components/AlbumSongCell.dart';
import 'package:flutter_tunein_attempt3/components/ArtistCell.dart';
import 'package:flutter_tunein_attempt3/components/card.dart';
import 'package:flutter_tunein_attempt3/components/pageheader.dart';
import 'package:flutter_tunein_attempt3/components/scrollbar.dart';
import 'package:flutter_tunein_attempt3/globals.dart';
import 'package:flutter_tunein_attempt3/models/playerstate.dart';
import 'package:flutter_tunein_attempt3/pages/single/singleAlbum.page.dart';
import 'package:flutter_tunein_attempt3/plugins/nano.dart';
import 'package:flutter_tunein_attempt3/services/locator.dart';
import 'package:flutter_tunein_attempt3/services/musicService.dart';
import 'package:flutter_tunein_attempt3/services/themeService.dart';
import 'package:flutter_tunein_attempt3/values/contextMenus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ArtistAlbumList extends StatefulWidget {
  final Artist artist;

  ArtistAlbumList(this.artist);

  @override
  _ArtistAlbumListState createState() => _ArtistAlbumListState();
}

class _ArtistAlbumListState extends State<ArtistAlbumList> {
  final musicService = locator<MusicService>();
  final themeService = locator<ThemeService>();
  ScrollController? controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemWidth = size.width / 3;

    return StreamBuilder(
      stream: themeService.getArtistColors(widget.artist).asStream(),
      builder: (BuildContext context, AsyncSnapshot<List<int>> snapshot) {
        List<int> bgColor;

        bgColor = snapshot.data!;

        /*return Container(
          padding: EdgeInsets.all(5),
          alignment: Alignment.center,
          color: bgColor!=null?Color(bgColor[0]).withRed(30).withGreen(30).withBlue(30):MyTheme.darkBlack,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Flexible(
                      child: ,
                    ),
                  ],
                ),
              ),
              MyScrollbar(
                controller: controller,
                color: bgColor!=null?Color(bgColor[0]).withRed(30).withGreen(30).withBlue(30):null,
              ),
            ],
          ),
        );*/
        return Container(
            padding: EdgeInsets.all(5),
            alignment: Alignment.center,
            color: bgColor != null
                ? Color(bgColor[0]).withRed(30).withGreen(30).withBlue(30)
                : MyTheme.darkBlack,
            child: GridView.builder(
              padding: EdgeInsets.all(0),
              itemCount: widget.artist.albums.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 3,
                crossAxisSpacing: 3,
                childAspectRatio: (itemWidth / (itemWidth + 50)),
              ),
              physics: ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                int newIndex = (index % 3) + 2;
                return GestureDetector(
                  onTap: () {
                    goToSingleArtistPage(widget.artist.albums[index]);
                  },
                  child: Material(
                    // the material widget here helps with the themes
                    //the non inclusion of it means you get double bars underneath the text
                    //this is not a must but you need to find a way to give a theme to your widget
                    //Material widget is the easiest and the one i am using in this app
                    child: AlbumGridCell(
                      widget.artist.albums[index],
                      135,
                      80,
                      animationDelay: (50 * newIndex) -
                          (index < 6 ? ((6 - index) * 160) : 0),
                    ),
                    color: Colors.transparent,
                  ),
                );
              },
            ));
      },
    );
  }

  void goToSingleArtistPage(Album album) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SingleAlbumPage(null, album: album),
      ),
    );
  }
}
