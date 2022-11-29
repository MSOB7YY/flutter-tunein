import 'package:flutter_tunein_attempt3/components/pagenavheader.dart';
import 'package:flutter_tunein_attempt3/pages/collection/favorites.page.dart';
import 'package:flutter_tunein_attempt3/pages/collection/playlists.page.dart';
import 'package:flutter_tunein_attempt3/services/layout.dart';
import 'package:flutter_tunein_attempt3/services/locator.dart';
import 'package:flutter/material.dart';

class CollectionPage extends StatelessWidget {
  CollectionPage({Key? key}) : super(key: key);
  final layoutService = locator<LayoutService>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PageNavHeader(
          pageIndex: 1,
        ),
        Flexible(
          child: PageView(
            physics: AlwaysScrollableScrollPhysics(),
            controller: layoutService.pageServices[1].pageViewController,
            children: [
              PlaylistsPage(),
              FavoritesPage(),
            ],
          ),
        )
      ],
    );
  }
}
